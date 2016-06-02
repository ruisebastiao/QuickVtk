import QtQuick 2.6

import "./lib" as Lib

Rectangle {
    id: root;

    color: "#282C34"

    MouseArea {
        anchors.fill: parent;

        onClicked: {
            root.forceActiveFocus();
        }
    }

    ContainerView {
        anchors.left: parent.left;
        anchors.right: outline.left;
        anchors.top: header.bottom;
        anchors.bottom: footer.top;
    }

    Header {
        id: header;

        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.top: parent.top;
    }

    Outline {
        id: outline;

        anchors.right: parent.right;
        anchors.top: header.bottom;
        anchors.bottom: footer.top;

        width: App.symbols.visible ? 220 : 0;
    }

    ErrorList {
        anchors.left: parent.left;
        anchors.bottom: footer.top;
        anchors.margins: 4;
    }

    Footer {
        id: footer;

        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
    }
}
