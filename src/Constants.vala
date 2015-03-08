namespace FeedReader {

	public enum Backend {
		NONE = -1,
		TTRSS = 0,
		FEEDLY,
		OWNCLOUD
	}

	public enum LogLevel {
		OFF,
		ERROR,
		MORE,
		DEBUG
	}

	public enum ConsoleColor {
        BLACK,
        RED,
        GREEN,
        YELLOW,
        BLUE,
        MAGENTA,
        CYAN,
        WHITE,
    }

	public enum LogMessage {
		ERROR,
		WARNING,
		INFO,
		DEBUG
	}

	public enum ConnectionError {
		SUCCESS,
		NO_RESPONSE,
		INVALID_SESSIONID,
		TTRSS_API,
		UNKNOWN
	}

	namespace TTRSSSpecialID {
		const int ARCHIVED      = 0;
		const int STARRED       = -1;
		const int PUBLISHED     = -2;
		const int FRESH         = -3;
		const int ALL           = -4;
		const int RECENTLY_READ = -6;
	}

	namespace ArticleStatus {
		const int READ		= 8;
		const int UNREAD	= 9;
		const int UNMARKED	= 10;
		const int MARKED	= 11;
		const int TOGGLE	= 12;
		const int ALL		= 13;
	}

	public enum LoginResponse {
		SUCCESS,
		MISSING_USER,
		MISSING_PASSWD,
		MISSING_URL,
		ALL_EMPTY,
		UNKNOWN_ERROR,
		FIRST_TRY,
		NO_BACKEND,
		WRONG_LOGIN,
		NO_CONNECTION
	}


	namespace FeedlySecret {
		 const string base_uri        = "http://cloud.feedly.com";
		 const string apiClientId     = "boutroue";
		 const string apiClientSecret = "FE012EGICU4ZOBDRBEOVAJA1JZYH";
		 const string apiRedirectUri  = "http://localhost";
		 const string apiAuthScope    = "https://cloud.feedly.com/subscriptions";
	}

	namespace AboutInfo {
		 const string programmName  = _("FeedReader");
		 const string copyright     = "Copyright © 2014 Jan Lukas Gernert";
		 const string version       = "0.2";
		 const string comments      = _("Desktop Client for various RSS Services");
		 const string[] authors     = { "Jan Lukas Gernert", null };
		 const string[] documenters = { "nobody", null };
		 const string[] artists     = {"Jan Lukas Gernert", "Jorge Marques"};
		 const string iconName      = "internet-news-reader";
		 const string translators   = null;
		 const string website       = null;
		 const string websiteLabel  = null;
	}

	public enum DataBase {
		INSERT_OR_IGNORE,
		INSERT_OR_REPLACE,
		UPDATE_ROW
	}

	namespace FeedList {
		 const int ALL_FEEDS = 24;
		 const int SPACER    = 25;
		 const int SEPERATOR = 26;
		 const int CATEGORY  = 27;
		 const int FEED      = 28;
		 const int HEADLINE  = 29;
		 const int TAG       = 30;
	}

	namespace CategoryID {
		 const string NONE          = "-99";
		 const string TTRSS_SPECIAL = "-1";
		 const string MASTER        = "-2";
		 const string TAGS          = "-3";
	}

	namespace FeedID {
		const string ALL = "-4";
	}

	// tango colors
	const string[] COLORS = {
								"#edd400", // butter medium
								"#f57900", // orange medium
								"#c17d11", // chocolate medium
								"#73d216", // chameleon medium
								"#3465a4", // sky blue medium
								"#75507b", // plum medium
								"#cc0000", // scarlet red medium
								"#d3d7cf", // aluminium medium

								"#fce94f", // butter light
								"#fcaf3e", // orange light
								"#e9b96e", // chocolate light
								"#8ae234", // chameleon light
								"#729fcf", // sky blue light
								"#ad7fa8", // plum light
								"#ef2929", // scarlet red light
								"#eeeeec", // aluminium light

								"#c4a000", // butter dark
								"#ce5c00", // orange dark
								"#8f5902", // chocolate dark
								"#4e9a06", // chameleon dark
								"#204a87", // sky blue dark
								"#5c3566", // plum dark
								"#a40000", // scarlet red dark
								"#babdb6"  // aluminium dark
							};
}