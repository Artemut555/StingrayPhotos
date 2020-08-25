import controls.Button;
import controls.FocusablePanel;

Rectangle {
    id: photo;
    focus: true;
    anchors.horizontalCenter: safeArea.horizontalCenter;
    anchors.fill: mainWindow;
    color: "#FFFFFF";
    Image {
        id: background;
        anchors.horizontalCenter: safeArea.horizontalCenter;
        anchors.verticalCenter: safeArea.verticalCenter;
        source: pageStack.url;
    }
}

