import controls.Button;
import controls.FocusablePanel;

Rectangle {
    id: mainMenu;
    focus: true;
    anchors.fill: mainWindow;
    color: "#FFFFFF";
 
    signal CodeEvent();  

    FocusablePanel {
        id: menuButton;
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

        onSelectPressed: {
            pageStack.code = 0;
            var request = new XMLHttpRequest();

            //getting code for website
            request.open("GET", "http://84.201.129.186:8000/get_key/", true);
            request.onreadystatechange = function() {
                if (request.readyState !== XMLHttpRequest.DONE)
                    return;
                    if (request.status === 200) {
                        log("response was received");
                        pageStack.code = JSON.parse(request.responseText)["key"];
                    } else
                        log("unhandled status", request.status);
            }
            request.send();
                
            log("StartButton PRESSED!");
            parent.CodeEvent();
        }
    }
}

