import QtQuick 2.12

import Lib 1.0 as Lib

Rectangle {

  color: "#21252B"
  visible: !App.console.collapsed;

  Rectangle {
    id: header;

    anchors.left: parent.left;
    anchors.right: parent.right;
    anchors.top: parent.top;

    height: label_type.height + 8;
    color: "#282C34"

    Lib.Label {
      id: label_type;

      anchors.verticalCenter: parent.verticalCenter;
      anchors.left: parent.left;

      leftPadding: 20;
      rightPadding: 20;

      text: "Type"
    }

    Lib.Label {
      anchors.verticalCenter: parent.verticalCenter;
      anchors.left: label_type.right;
      anchors.right: label_time.left;

      text: "Description"
    }

    Lib.Label {
      id: label_time;

      anchors.verticalCenter: parent.verticalCenter;
      anchors.right: parent.right;
      rightPadding: 18;

      text: "Time"
    }
  }

  Rectangle {
    anchors.left: parent.left;
    anchors.right: parent.right;
    anchors.top: parent.top;

    height: 1;
    color: "#181A1F";
  }

  Lib.ListView {
    anchors.top: header.bottom;
    anchors.left: parent.left;
    anchors.right: parent.right;
    anchors.bottom: footer.top;

    model: App.console.items;

    delegate: Item {

      anchors.left: parent.left;
      anchors.right: parent.right;
      height: _description.height + 4;

      Item {
        id: _label;

        anchors.top: parent.top;
        anchors.bottom: parent.bottom;

        //color: modelData.type == 2 ? "#D4B05E" : modelData.type == 3 ? "#C54632" : "transparent";
        width: label_type.width;

        Lib.Label {
          anchors.left: parent.left;
          anchors.verticalCenter: parent.verticalCenter;

          leftPadding: 4;
          rightPadding: 4;
          text: modelData.label;
          //color: modelData.type > 1 ? "#fff" : "#9DA5B4"
          font.bold: modelData.type > 1;
          color: modelData.type == 2 ? "#D4B05E" : modelData.type == 3 ? "#C54632" : "#9DA5B4";
        }
      }

      Lib.Label {
        id: _description;

        text: modelData.description;
        anchors.verticalCenter: parent.verticalCenter;
        anchors.left: _label.right;
        anchors.right: _time.left;
      }

      Lib.Label {
        id: _time;

        text: modelData.time;
        anchors.right: parent.right;
        anchors.verticalCenter: parent.verticalCenter;
        rightPadding: 4;
      }
    }
  }

  Item {
    id: footer;

    anchors.left: parent.left;
    anchors.right: parent.right;
    anchors.bottom: parent.bottom;

    height: 30;

    Rectangle {
      anchors.left: parent.left;
      anchors.right: parent.right;
      anchors.top: parent.top;

      height: 1;
      color: "#181A1F";
    }

    Lib.Button {
      id: btn_clear;

      anchors.verticalCenter: parent.verticalCenter;
      anchors.right: parent.right;
      anchors.rightMargin: 8;

      frameless: true;
      icon: icons.fa_trash;
      label.text: "Clear";
      onClicked: App.console.clear();
    }
  }
}
