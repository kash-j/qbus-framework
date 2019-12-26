var CurrentTwitterTab = "twitter-home"
var HashtagOpen = false;

$(document).on('click', '.twitter-header-tab', function(e){
    e.preventDefault();

    var PressedTwitterTab = $(this).data('twittertab');
    var PreviousTwitterTabObject = $('.twitter-header').find('[data-twittertab="'+CurrentTwitterTab+'"]');

    if (PressedTwitterTab !== CurrentTwitterTab) {
        $(this).addClass('selected-twitter-header-tab');
        $(PreviousTwitterTabObject).removeClass('selected-twitter-header-tab');

        $("."+CurrentTwitterTab+"-tab").css({"display":"none"});
        $("."+PressedTwitterTab+"-tab").css({"display":"block"});

        if (PressedTwitterTab === "twitter-mentions") {
            $.post('http://qb-phone_new/ClearMentions');
        }

        CurrentTwitterTab = PressedTwitterTab;

        if (HashtagOpen) {
            event.preventDefault();

            $(".twitter-hashtag-tweets").css({"left": "30vh"});
            $(".twitter-hashtags").css({"left": "0vh"});
            $(".twitter-new-tweet").css({"display":"block"});
            $(".twitter-hashtags").css({"display":"block"});
            HashtagOpen = false;
        }
    } else if (CurrentTwitterTab == "twitter-hashtags" && PressedTwitterTab == "twitter-hashtags") {
        if (HashtagOpen) {
            event.preventDefault();

            $(".twitter-hashtags").css({"display":"block"});
            $(".twitter-hashtag-tweets").animate({
                left: 30+"vh"
            }, 150);
            $(".twitter-hashtags").animate({
                left: 0+"vh"
            }, 150);
            HashtagOpen = false;
        }
    }
});

$(document).on('click', '.twitter-new-tweet', function(e){
    e.preventDefault();

    QB.Phone.Animations.TopSlideDown(".twitter-new-tweet-tab", 450, 0);
});

QB.Phone.Notifications.LoadTweets = function(Tweets) {
    Tweets = Tweets.reverse();
    if (Tweets !== null && Tweets !== undefined && Tweets !== "" && Tweets.length > 0) {
        $(".twitter-home-tab").html("");
        $.each(Tweets, function(i, Tweet){
            var TwtMessage = QB.Phone.Functions.FormatTwitterMessage(Tweet.message);
            var today = new Date();
            var TweetTime = new Date(Tweet.time);
            var diffMs = (today - TweetTime);
            var diffDays = Math.floor(diffMs / 86400000);
            var diffHrs = Math.floor((diffMs % 86400000) / 3600000);
            var diffMins = Math.round(((diffMs % 86400000) % 3600000) / 60000);
            var diffSeconds = Math.round(diffMs / 1000);
            var TimeAgo = diffSeconds + ' s';

            if (diffSeconds > 60) {
                TimeAgo = diffMins + ' m';
            } else if (diffMins > 60) {
                TimeAgo = diffHrs + ' h';
            } else if (diffHrs > 24) {
                TimeAgo = diffDays + ' d';
            }

            var TwitterHandle = Tweet.firstName + ' ' + Tweet.lastName
    
            var TweetElement = '<div class="twitter-tweet"> <img src="./img/backgrounds/background-1.png" class="tweeter-image"><div class="tweet-tweeter">'+Tweet.firstName+' '+Tweet.lastName+' &nbsp;<span>@'+TwitterHandle.replace(" ", "_")+' &middot; '+TimeAgo+'</span></div> <div class="tweet-message">'+TwtMessage+'</div></div>';
        
            $(".twitter-home-tab").append(TweetElement);
        });
    }
}

QB.Phone.Notifications.LoadMentionedTweets = function(Tweets) {
    Tweets = Tweets.reverse();
    if (Tweets.length > 0) {
        $(".twitter-mentions-tab").html("");
        $.each(Tweets, function(i, Tweet){
            var TwtMessage = QB.Phone.Functions.FormatTwitterMessage(Tweet.message);
            var today = new Date();
            var TweetTime = new Date(Tweet.time);
            var diffMs = (today - TweetTime);
            var diffDays = Math.floor(diffMs / 86400000);
            var diffHrs = Math.floor((diffMs % 86400000) / 3600000);
            var diffMins = Math.round(((diffMs % 86400000) % 3600000) / 60000);
            var diffSeconds = Math.round(diffMs / 1000);
            var TimeAgo = diffSeconds + ' s';

            if (diffSeconds > 60) {
                TimeAgo = diffMins + ' m';
            } else if (diffMins > 60) {
                TimeAgo = diffHrs + ' h';
            } else if (diffHrs > 24) {
                TimeAgo = diffDays + ' d';
            }
    
            var TweetElement = '<div class="twitter-mentioned-tweet"> <img src="./img/backgrounds/background-1.png" class="tweeter-image"><div class="tweet-tweeter">'+Tweet.firstName+' '+Tweet.lastName+' &nbsp;<span>@'+Tweet.firstName+'_'+Tweet.lastName+' &middot; '+TimeAgo+'</span></div> <div class="tweet-message">'+TwtMessage+'</div></div>';
            $(".twitter-mentioned-tweet").css({"background-color":"#F5F8FA"});
            $(".twitter-mentions-tab").append(TweetElement);
        });
    }
}

QB.Phone.Functions.FormatTwitterMessage = function(TwitterMessage) {
    var TwtMessage = TwitterMessage;
    var res = TwtMessage.split("@");

    for(i = 1; i < res.length; i++) {
        var MentionTag = res[i].split(" ")[0];
        if (MentionTag !== null && MentionTag !== undefined && MentionTag !== "") {
            TwtMessage = TwtMessage.replace("@"+MentionTag, "<span class='mentioned-tag' data-mentiontag='@"+MentionTag+"' style='color: rgb(27, 149, 224);'>@"+MentionTag+"</span>");
        }
    }

    return TwtMessage
}

$(document).on('click', '#send-tweet', function(e){
    e.preventDefault();

    var TweetMessage = $("#tweet-new-message").val();

    if (TweetMessage != "") {
        var CurrentDate = new Date();
        $.post('http://qb-phone_new/PostNewTweet', JSON.stringify({
            Message: TweetMessage,
            Date: CurrentDate
        }), function(Tweets){
            QB.Phone.Notifications.LoadTweets(Tweets);
        });
        $.post('http://qb-phone_new/GetHashtags', JSON.stringify({}), function(Hashtags){
            QB.Phone.Notifications.LoadHashtags(Hashtags)
        })
        QB.Phone.Animations.TopSlideUp(".twitter-new-tweet-tab", 450, -120);
    } else {
        QB.Phone.Notifications.Add("fab fa-twitter", "Twitter", "Vul een bericht!", "#1DA1F2");
    }
});

$(document).on('click', '#cancel-tweet', function(e){
    e.preventDefault();

    QB.Phone.Animations.TopSlideUp(".twitter-new-tweet-tab", 450, -120);
});

$(document).on('click', '.mentioned-tag', function(e){
    e.preventDefault();
    CopyMentionTag(this);
});

function CopyMentionTag(elem) {
    var $temp = $("<input>");
    $("body").append($temp);
    console.log($(elem).data('mentiontag'));
    $temp.val($(elem).data('mentiontag')).select();
    QB.Phone.Notifications.Add("fab fa-twitter", "Twitter", $(elem).data('mentiontag')+ " gekopieerd!", "rgb(27, 149, 224)", 1250);
    document.execCommand("copy");
    $temp.remove();
}

QB.Phone.Notifications.LoadHashtags = function(hashtags) {
    if (hashtags !== null) {
        $(".twitter-hashtags").html("");
        $.each(hashtags, function(i, hashtag){
            var Elem = '<div class="twitter-hashtag" id="tag-'+hashtag.hashtag+'"><div class="twitter-hashtag-status">Niet trending in Qbus</div> <div class="twitter-hashtag-tag">#'+hashtag.hashtag+'</div> <div class="twitter-hashtag-messages">'+hashtag.messages.length+' Tweets</div> </div>';
        
            $(".twitter-hashtags").append(Elem);
            $("#tag-"+hashtag.hashtag).data('tagData', hashtag);
        });
    }
}

QB.Phone.Notifications.LoadHashtagMessages = function(Tweets) {
    Tweets = Tweets.reverse();
    if (Tweets !== null && Tweets !== undefined && Tweets !== "" && Tweets.length > 0) {
        $(".twitter-hashtag-tweets").html("");
        $.each(Tweets, function(i, Tweet){
            var TwtMessage = QB.Phone.Functions.FormatTwitterMessage(Tweet.message);
            var today = new Date();
            var TweetTime = new Date(Tweet.time);
            var diffMs = (today - TweetTime);
            var diffDays = Math.floor(diffMs / 86400000);
            var diffHrs = Math.floor((diffMs % 86400000) / 3600000);
            var diffMins = Math.round(((diffMs % 86400000) % 3600000) / 60000);
            var diffSeconds = Math.round(diffMs / 1000);
            var TimeAgo = diffSeconds + ' s';

            if (diffSeconds > 60) {
                TimeAgo = diffMins + ' m';
            } else if (diffMins > 60) {
                TimeAgo = diffHrs + ' h';
            } else if (diffHrs > 24) {
                TimeAgo = diffDays + ' d';
            }

            var TwitterHandle = Tweet.firstName + ' ' + Tweet.lastName
    
            var TweetElement = '<div class="twitter-tweet-hashtag"> <img src="./img/backgrounds/background-1.png" class="tweeter-image"><div class="tweet-tweeter">'+Tweet.firstName+' '+Tweet.lastName+' &nbsp;<span>@'+TwitterHandle.replace(" ", "_")+' &middot; '+TimeAgo+'</span></div> <div class="tweet-message">'+TwtMessage+'</div></div>';
        
            $(".twitter-hashtag-tweets").append(TweetElement);
        });
    }
}


$(document).on('click', '.twitter-hashtag', function(event){
    event.preventDefault();

    var TweetId = $(this).attr('id');
    var TweetData = $("#"+TweetId).data('tagData');

    QB.Phone.Notifications.LoadHashtagMessages(TweetData.messages);

    $(".twitter-hashtag-tweets").css({"display":"block", "left":"30vh"});
    $(".twitter-hashtag-tweets").animate({
        left: 0+"vh"
    }, 150);
    $(".twitter-hashtags").animate({
        left: -30+"vh"
    }, 150, function(){
        $(".twitter-hashtags").css({"display":"none"});
    });
    HashtagOpen = true;
});