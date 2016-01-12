//	This file is part of FeedReader.
//
//	FeedReader is free software: you can redistribute it and/or modify
//	it under the terms of the GNU General Public License as published by
//	the Free Software Foundation, either version 3 of the License, or
//	(at your option) any later version.
//
//	FeedReader is distributed in the hope that it will be useful,
//	but WITHOUT ANY WARRANTY; without even the implied warranty of
//	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//	GNU General Public License for more details.
//
//	You should have received a copy of the GNU General Public License
//	along with FeedReader.  If not, see <http://www.gnu.org/licenses/>.

public class FeedReader.OfflineActionManager : GLib.Object {

	private OfflineActions m_lastAction = OfflineActions.NONE;
	private string m_ids = "";

	public OfflineActionManager()
	{

	}


	public void markArticleRead(string id)
	{
		var action = new OfflineAction(OfflineActions.MARK_READ, id, "");
		addAction(action);
	}

	public void markArticleUnread(string id)
	{
		var action = new OfflineAction(OfflineActions.MARK_UNREAD, id, "");
		addAction(action);
	}

	public void markArticleStarred(string id)
	{
		var action = new OfflineAction(OfflineActions.MARK_STARRED, id, "");
		addAction(action);
	}

	public void markArticleUnstarred(string id)
	{
		var action = new OfflineAction(OfflineActions.MARK_UNSTARRED, id, "");
		addAction(action);
	}

	public void markFeedRead(string id)
	{
		var action = new OfflineAction(OfflineActions.MARK_READ_FEED, id, "");
		addAction(action);
	}

	public void markCategoryRead(string id)
	{
		var action = new OfflineAction(OfflineActions.MARK_READ_CATEGORY, id, "");
		addAction(action);
	}

	public void markAllRead()
	{
		var action = new OfflineAction(OfflineActions.MARK_READ_ALL, "", "");
		addAction(action);
	}

	private void addAction(OfflineAction action)
	{
		if(dataBase.offlineActionNecessary(action))
		{
			dataBase.deleteOppositeOfflineAction(action);
		}
		else
		{
			dataBase.addOfflineAction(action.getType(), action.getID());
		}
	}

	public void goOnline()
	{
		var actions = dataBase.readOfflineActions();

		foreach(OfflineAction action in actions)
		{
			switch(action.getType())
			{
				case OfflineActions.MARK_READ:
				case OfflineActions.MARK_UNREAD:
				case OfflineActions.MARK_STARRED:
				case OfflineActions.MARK_UNSTARRED:
					if(action.getType() != m_lastAction)
					{
						executeActions(m_ids, m_lastAction);
						m_lastAction = OfflineActions.NONE;
						m_ids = "";
					}
					else
					{
						m_ids += "," + action.getID();
					}
					break;
				case OfflineActions.MARK_READ_FEED:
					server.setFeedRead(action.getID());
					break;
				case OfflineActions.MARK_READ_CATEGORY:
					server.setCategorieRead(action.getID());
					break;
				case OfflineActions.MARK_READ_ALL:
					server.markAllItemsRead();
					break;
			}

			m_lastAction = action.getType();
		}

		dataBase.resetOfflineActions();
	}

	private void executeActions(string ids, OfflineActions action)
	{
		switch(action)
		{
			case OfflineActions.MARK_READ:
				server.setArticleIsRead(ids, ArticleStatus.READ);
				break;
			case OfflineActions.MARK_UNREAD:
				server.setArticleIsRead(ids, ArticleStatus.UNREAD);
				break;
			case OfflineActions.MARK_STARRED:
				server.setArticleIsMarked(ids, ArticleStatus.MARKED);
				break;
			case OfflineActions.MARK_UNSTARRED:
				server.setArticleIsMarked(ids, ArticleStatus.UNMARKED);
				break;
		}
	}

}
