import controls.Button;
import controls.FocusablePanel;

Item {
    id: photo;
    focus: true;
    anchors.horizontalCenter: safeArea.horizontalCenter;

    Image {
        id: background;
        anchors.horizontalCenter: safeArea.horizontalCenter;
        anchors.verticalCenter: safeArea.verticalCenter;
        source: pageStack.url;
    }
}
