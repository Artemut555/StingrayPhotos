import controls.Edit;

Item{
    height:650;
    width:1250;
    focus: true;

    Image {
        id: background;
        anchors.horizontalCenter: safeArea.horizontalCenter;
        anchors.verticalCenter: safeArea.verticalCenter;
        source: "apps/StingrayPhotos/img/MenuBackground.png";//another picture
    }
    
    signal PhotosEvent();

    function getKey() {
        var request = new XMLHttpRequest();
        request.open("GET", "http://127.0.0.1:8000/get_key/", true);
        var key;
        request.onreadystatechange = function() {
            if (request.readyState !== XMLHttpRequest.DONE)
                return;
            if (request.status === 200) {
                log("response was received");
                key = JSON.parse(request.responseText)["key"];
            } else
                log("unhandled status", request.status);
        }
        request.send();
        return key;
    }

    FocusablePanel {

        id: codeButton;
        anchors.horizontalCenter: safeArea.horizontalCenter;
        anchors.verticalCenter: safeArea.verticalCenter;
        width: 180;
        height: 180;
        color: active ? "#ddddff" : colorTheme.focusablePanelColor;
        radius: 90;
        Image {
                id: txt;
            source: "apps/StingrayPhotos/img/play.png";
            width: 180;
            height: 180;
            anchors.horizontalCenter: safeArea.horizontalCenter;
            anchors.verticalCenter: safeArea.verticalCenter;
        }
        //сгенеренный код и кнопка продолжить
        onSelectPressed: {
            log("CodeButton PRESSED!");
            parent.PhotosEvent();
        }
    }
}
