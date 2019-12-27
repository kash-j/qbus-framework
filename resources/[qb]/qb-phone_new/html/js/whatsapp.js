$(document).ready(function(){
    $("#whatsapp-search-input").on("keyup", function() {
        var value = $(this).val().toLowerCase();
        $(".whatsapp-chats .whatsapp-chat").filter(function() {
          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });
});

$(document).on('click', '#whatsapp-search-chats', function(e){
    e.preventDefault();

    if ($("#whatsapp-search-input").css('display') == "none") {
        $("#whatsapp-search-input").fadeIn(150);
    } else {
        $("#whatsapp-search-input").fadeOut(150);
    }
});

$(document).on('click', '.whatsapp-chat', function(e){
    e.preventDefault();

    var ChatId = $(this).attr('id');
    var ChatData = $("#"+ChatId).data('chatdata');
    QB.Phone.Functions.SetupChatMessages(ChatData);

    $.post('http://qb-phone_new/ClearAlerts', JSON.stringify({
        number: ChatData.number
    }));

    $('.whatsapp-openedchat-messages').animate({scrollTop: 9999}, 150);
    $(".whatsapp-openedchat").css({"display":"block"});
    $(".whatsapp-openedchat").animate({
        left: 0+"vh"
    },200);
    $(".whatsapp-chats").animate({
        left: 30+"vh"
    },200, function(){
        $(".whatsapp-chats").css({"display":"none"});
    });
});

$(document).on('click', '#whatsapp-openedchat-back', function(e){
    e.preventDefault();
    $.post('http://qb-phone_new/GetWhatsappChats', JSON.stringify({}), function(chats){
        QB.Phone.Functions.LoadWhatsappChats(chats);
    });
    OpenedChatData.number = null;
    $(".whatsapp-chats").css({"display":"block"});
    $(".whatsapp-chats").animate({
        left: 0+"vh"
    }, 200);
    $(".whatsapp-openedchat").animate({
        left: -30+"vh"
    }, 200, function(){
        $(".whatsapp-openedchat").css({"display":"none"});
    });
});

QB.Phone.Functions.GetLastMessage = function(message) {
    var CurrentDate = new Date();
    var CurrentMonth = CurrentDate.getMonth();
    var CurrentDOM = CurrentDate.getDate();
    var CurrentYear = CurrentDate.getFullYear();
    var LastMessageData = {
        time: "00:00",
        message: "nikss"
    }

    $.each(message, function(i, msg){
        var msgData = msg[msg.length - 1];
        LastMessageData.time = msgData.time
        LastMessageData.message = msgData.message
    });

    return LastMessageData
}

GetCurrentDateKey = function() {
    var CurrentDate = new Date();
    var CurrentMonth = CurrentDate.getMonth();
    var CurrentDOM = CurrentDate.getDate();
    var CurrentYear = CurrentDate.getFullYear();
    var CurDate = ""+CurrentDOM+"-"+CurrentMonth+"-"+CurrentYear+"";

    return CurDate;
}

QB.Phone.Functions.LoadWhatsappChats = function(chats) {
    $(".whatsapp-chats").html("");
    $.each(chats, function(i, chat){
        var LastMessage = QB.Phone.Functions.GetLastMessage(chat.messages);
        var ChatElement = '<div class="whatsapp-chat" id="whatsapp-chat-'+i+'"><div class="whatsapp-chat-picture"></div><div class="whatsapp-chat-name"><p>'+chat.name+'</p></div><div class="whatsapp-chat-lastmessage"><p>'+LastMessage.message+'</p></div> <div class="whatsapp-chat-lastmessagetime"><p>'+LastMessage.time+'</p></div><div class="whatsapp-chat-unreadmessages unread-chat-id-'+i+'">1</div></div>';
        
        $(".whatsapp-chats").append(ChatElement);
        $("#whatsapp-chat-"+i).data('chatdata', chat);

        if (chat.Unread > 0 && chat.Unread !== undefined && chat.Unread !== null) {
            $(".unread-chat-id-"+i).html(chat.Unread);
            $(".unread-chat-id-"+i).css({"display":"block"});
        } else {
            $(".unread-chat-id-"+i).css({"display":"none"});
        }
    });
}

QB.Phone.Functions.ReloadWhatsappAlerts = function(chats) {
    $.each(chats, function(i, chat){
        if (chat.Unread > 0 && chat.Unread !== undefined && chat.Unread !== null) {
            $(".unread-chat-id-"+i).html(chat.Unread);
            $(".unread-chat-id-"+i).css({"display":"block"});
        } else {
            $(".unread-chat-id-"+i).css({"display":"none"});
        }
    });
}

const monthNames = ["Januari", "Februari", "Maart", "April", "Mei", "Juni", "Juli", "Augustus", "September", "Oktober", "November", "December"];

FormatChatDate = function(date) {
    var TestDate = date.split("-");
    var NewDate = new Date(""+TestDate[1]+"-"+TestDate[0]+"-"+TestDate[2]);
    var CurrentMonth = monthNames[NewDate.getMonth()];
    var CurrentDOM = NewDate.getDate();
    var CurrentYear = NewDate.getFullYear();
    var CurDateee = CurrentDOM + "-" + (NewDate.getMonth() + 1) + "-" + CurrentYear;
    var ChatDate = CurrentDOM + " " + CurrentMonth + " " + CurrentYear;
    var CurrentDate = GetCurrentDateKey();

    var ReturnedValue = ChatDate;
    if (CurrentDate == CurDateee) {
        ReturnedValue = "VANDAAG";
    }

    return ReturnedValue;
}

FormatMessageTime = function() {
    var NewDate = new Date();
    var NewHour = NewDate.getHours();
    var NewMinute = NewDate.getMinutes();
    var Minutessss = NewMinute;
    var Hourssssss = NewHour;
    if (NewMinute < 10) {
        Minutessss = "0" + NewMinute;
    }
    if (NewHour < 10) {
        Hourssssss = "0" + NewHour;
    }
    var MessageTime = Hourssssss + ":" + Minutessss
    return MessageTime;
}

$(document).on('click', '#whatsapp-openedchat-send', function(e){
    e.preventDefault();

    var Message = $("#whatsapp-openedchat-message").val();

    if (Message !== null && Message !== undefined && Message !== "") {
        $.post('http://qb-phone_new/SendMessage', JSON.stringify({
            ChatNumber: OpenedChatData.number,
            ChatDate: GetCurrentDateKey(),
            ChatMessage: Message,
            ChatTime: FormatMessageTime(),
        }));
        $("#whatsapp-openedchat-message").val("");
    } else {
        QB.Phone.Notifications.Add("fab fa-whatsapp", "Whatsapp", "Je kan geen leeg bericht sturen!", "#25D366", 1750);
    }
});

QB.Phone.Functions.SetupChatMessages = function(cData, NewChatData) {
    if (cData !== false) {
        OpenedChatData.number = cData.number;
        $(".whatsapp-openedchat-name").html("<p>"+cData.name+"</p>");
        $(".whatsapp-openedchat-messages").html("");
        $.each(cData.messages, function(i, chat){
            var ChatDate = FormatChatDate(i);
            var ChatDiv = '<div class="whatsapp-openedchat-messages-'+i+' unique-chat"><div class="whatsapp-openedchat-date">'+ChatDate+'</div></div>';
    
            $(".whatsapp-openedchat-messages").append(ChatDiv);
    
            $.each(cData.messages[i], function(index, message){
                var Sender = "me";
                if (message.sender !== QB.Phone.Data.PlayerData.citizenid) { Sender = "other"; }
                var MessageElement = '<div class="whatsapp-openedchat-message whatsapp-openedchat-message-'+Sender+'">'+message.message+'<div class="whatsapp-openedchat-message-time">'+message.time+'</div></div><div class="clearfix"></div>'
                $(".whatsapp-openedchat-messages-"+i).append(MessageElement);
            });
        });
        $('.whatsapp-openedchat-messages').animate({scrollTop: 9999}, 1);
    } else {
        OpenedChatData.number = NewChatData.number;
        $(".whatsapp-openedchat-name").html("<p>"+NewChatData.name+"</p>");
        $(".whatsapp-openedchat-messages").html("");
        var NewDate = new Date();
        var NewDateMonth = NewDate.getMonth();
        var NewDateDOM = NewDate.getDate();
        var NewDateYear = NewDate.getFullYear();
        var DateString = ""+NewDateDOM+"-"+(NewDateMonth+1)+"-"+NewDateYear;
        var ChatDiv = '<div class="whatsapp-openedchat-messages-'+DateString+' unique-chat"><div class="whatsapp-openedchat-date">VANDAAG</div></div>';

        $(".whatsapp-openedchat-messages").append(ChatDiv);
    }

    $('.whatsapp-openedchat-messages').animate({scrollTop: 9999}, 1);
}