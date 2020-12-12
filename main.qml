import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.5
import "custom"

ApplicationWindow {
    visible: true
    width: 320
    height: 640

    property bool computed: false
    property bool portrait: width < height
    property string screenProblem: "0"
    property string bg_problem: "0"
    property string evaluation: ""

    signal btn_click(string num)
    signal uniClick(string code, string repl)
    signal deleteText()

    onBtn_click:  {
          let stat = num;

          if(computed) {
              screenProblem = '0';
              bg_problem = '0';
              computed = false;
          }

         if (screenProblem != '0') {
              screenProblem += stat;
              bg_problem += stat;
          } else if(stat == '.' & screenProblem == '0') {
              screenProblem = '0.'
              bg_problem = '0.'
          } else {
                screenProblem = stat;
                bg_problem = stat;
          }

          if (scr_lab.width > answer_sheet.width){
                flicker.flick(-512, 0);
          }

    }

    onUniClick: {
        var stat = '<span style="font-family: Segoe MDL2 Assets; font-size: 18px;">' + code + '</span>';

        if (screenProblem !== 0) {
            screenProblem += stat;
            bg_problem += repl;
        } else {
              screenProblem = stat;
              bg_problem = repl;
        }

        if (scr_lab.width > answer_sheet.width){
                flicker.flick(-512, 0);
        }

    }


    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            id:answer_sheet
            Layout.fillWidth: true
            Layout.preferredHeight: 260
             color: "#0f0f0f"


            ColumnLayout {
                 width: parent.width
                 anchors.right: parent.right
                 anchors.verticalCenter: parent.verticalCenter


                 Rectangle { // input  show
                     Layout.preferredWidth: scr_lab.width
                     Layout.preferredHeight: 48
                     Layout.maximumWidth: parent.parent.width
                     Layout.alignment: Qt.AlignRight
                     color: "transparent"

                     Flickable {
                            id: flicker
                            width: parent.width
                            height: parent.height
                            contentWidth: scr_lab.width
                            contentHeight: scr_lab.height
                            flickableDirection: Flickable.HorizontalFlick


                            Label {
                                id: scr_lab
                                text: screenProblem
                                textFormat: Text.RichText
                                leftPadding: 8
                                font.family: "Segoe UI Semilight"
                                font.pixelSize: 35
                                font.bold: false
                                color: "#d6d6d6"

                            }
                     }
                 }

                 Rectangle {   // output in blue
                     Layout.preferredWidth: eval_lab.width
                     Layout.preferredHeight: 48
                     Layout.maximumWidth: parent.parent.width
                     Layout.alignment: Qt.AlignRight
                     color: "transparent"


                      Flickable {
                            width: parent.width
                            height: parent.height
                            contentWidth: eval_lab.width
                            contentHeight: eval_lab.height
                            flickableDirection: Flickable.HorizontalFlick

                            Label {
                                id: eval_lab
                                text: evaluation
                                textFormat: Text.RichText
                                leftPadding: 8
                                font.family: "Segoe UI Semilight"
                                font.pixelSize: 30
                                font.bold: true
                                color: "white"
                            }
                     }

                 }

            }

            Rectangle { //border
                anchors.bottom: parent.bottom
                width: parent.width
                height: 1
                color: "#b5b5b5"
              }

             }







             Rectangle {
             //Button

                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "transparent"



                 Rectangle {// s size
                 anchors.fill: parent
                 color: "#0f0f0f"
                 visible: portrait



                 GridLayout {
                     anchors.fill: parent
                     columns: 4
                     rowSpacing: 0
                     columnSpacing: 0


                     CalcButton {
                         text: "AC"
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 1
                         Layout.columnSpan: 1
                         bg_color: "#0f0f0f"
                         txt_color: "#ff5714"

                         onClicked: screenProblem = '0'

                    }

                    // %
                    CalcButton {
                         text: "\uE94C"
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 1
                         Layout.columnSpan: 1
                         bg_color: "#0f0f0f"
                         txt_color: "#ff5714"

                         onClicked: uniClick(this.text, '%')

                    }

                    CalcButton {
                         text: "\uE94A"
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 1
                         Layout.columnSpan: 1
                         bg_color: "#0f0f0f"
                         txt_color: "#ff5714"

                         onClicked: uniClick(this.text, '/')

                    }
                    CalcButton {
                         text: "\uE947"
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 1
                         Layout.columnSpan: 1
                         bg_color: "#0f0f0f"
                         txt_color: "#ff5714"

                         onClicked: uniClick(this.text, '*')

                    }




                     CalcButton {
                         text: "7"
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 1
                         Layout.columnSpan: 1
                         bg_color: "#0f0f0f"
                         txt_color: "white"

                         onClicked: btn_click(this.text)

                    }
                    CalcButton {
                         text: "8"
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 1
                         Layout.columnSpan: 1
                         bg_color: "#0f0f0f"
                         txt_color: "white"

                         onClicked: btn_click(this.text)

                    }
                     CalcButton {
                         text: "9"
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 1
                         Layout.columnSpan: 1
                         bg_color: "#0f0f0f"
                         txt_color: "white"

                          onClicked: btn_click(this.text)

                    }
                    // - sign

                    CalcButton {
                         text: "\uE949"
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 1
                         Layout.columnSpan: 1
                         bg_color: "#0f0f0f"
                         txt_color: "#ff5714"

                          onClicked: uniClick(this.text, '-')

                    }



                     CalcButton {
                         text: "4"
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 1
                         Layout.columnSpan: 1
                         bg_color: "#0f0f0f"
                         txt_color: "white"

                         onClicked: btn_click(this.text)

                    }
                    CalcButton {
                         text: "5"
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 1
                         Layout.columnSpan: 1
                         bg_color: "#0f0f0f"
                         txt_color: "white"

                         onClicked: btn_click(this.text)

                    }
                    CalcButton {
                         text: "6"
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 1
                         Layout.columnSpan: 1
                         bg_color: "#0f0f0f"
                         txt_color: "white"

                         onClicked: btn_click(this.text)

                    }

                    // + sign

                    CalcButton {
                         text: "\uE948"
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 2
                         Layout.columnSpan: 1
                         bg_color: "#0f0f0f"
                         txt_color: "#ff5714"

                         onClicked: uniClick(this.text, '+')

                    }



                     CalcButton {
                         text: "1"
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 1
                         Layout.columnSpan: 1
                         bg_color: "#0f0f0f"
                         txt_color: "white"

                         onClicked: btn_click(this.text)

                    }
                    CalcButton {
                         text: "2"
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 1
                         Layout.columnSpan: 1
                         bg_color: "#0f0f0f"
                         txt_color: "white"

                         onClicked: btn_click(this.text)

                    }
                    CalcButton {
                         text: "3"
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 1
                         Layout.columnSpan: 1
                         bg_color: "#0f0f0f"
                         txt_color: "white"

                         onClicked: btn_click(this.text)

                    }





                    CalcButton {
                         text: "00"
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 1
                         Layout.columnSpan: 1
                         bg_color: "#0f0f0f"
                         txt_color: "white"

                         onClicked: btn_click(this.text)

                    }
                    CalcButton {
                         text: "0"
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 1
                         Layout.columnSpan: 1
                         bg_color: "#0f0f0f"
                         txt_color: "white"

                         onClicked: btn_click(this.text)

                    }
                    CalcButton {
                         text: "."
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 1
                         Layout.columnSpan: 1
                         bg_color: "#0f0f0f"
                         txt_color: "white"

                         onClicked: btn_click(this.text)

                    }
                    // = sign

                    CalcButton {
                         text: "\uE94E"
                         Layout.fillWidth: true
                         Layout.fillHeight: true
                         Layout.rowSpan: 1
                         Layout.columnSpan: 1
                         bg_color: "#ff5714"
                         txt_color: "white"

                         onClicked: {
                                 computed = true;
                                 Calculator.compute(bg_problem)
                         }

                    }

                 }




            }




            Rectangle {// full size
                 anchors.fill: parent
                 visible: !portrait
                 color: "#ff5714"

                 RowLayout {
                      anchors.fill: parent
                      anchors.leftMargin: 48
                      anchors.rightMargin: 48
                      anchors.topMargin: 54
                      anchors.bottomMargin: 54
                      spacing: 48

                      Rectangle {  // function
                           Layout.fillWidth: true
                           Layout.maximumWidth: 620
                           Layout.fillHeight: true
                           Layout.minimumHeight: 300
                           color: "#ff5714"

                           GridLayout {
                                anchors.fill: parent
                                anchors.margins: 1
                                rowSpacing: 1
                                columnSpacing: 1
                                columns: 4



                                CalcButton {
                                    text: "AC"
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    Layout.rowSpan: 1
                                    Layout.columnSpan: 2
                                    txt_color: "#0f0f0f"
                                    bg_color: "#fc4c00"

                                    onClicked: screenProblem = '0'

                               }
                               CalcButton {
                                        text: "\uE94C"
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        Layout.rowSpan: 1
                                        Layout.columnSpan: 1
                                         txt_color: "#ff5714"
                                         bg_color: "#0f0f0f"

                                         onClicked: uniClick(this.text, '%')

                                   }
                               CalcButton {
                                    text: "\uE94A"
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    Layout.rowSpan: 1
                                    Layout.columnSpan: 1
                                    bg_color: "#0f0f0f"
                                    txt_color: "#ff5714"

                                    onClicked: uniClick(this.text, '/')

                               }



                                CalcButton {
                                    text: "\uE947"
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    Layout.rowSpan: 1
                                    Layout.columnSpan: 1
                                    bg_color: "#0f0f0f"
                                    txt_color: "#ff5714"

                                    onClicked: uniClick(this.text, '*')

                               }





                               CalcButton {
                                     text: "\uE949"
                                     Layout.fillWidth: true
                                     Layout.fillHeight: true
                                     Layout.rowSpan: 1
                                     Layout.columnSpan: 1
                                     bg_color: "#0f0f0f"
                                     txt_color: "#ff5714"

                                     onClicked: uniClick(this.text, '-')

                                }
                                CalcButton {
                                     text: "\uE948"
                                     Layout.fillWidth: true
                                     Layout.fillHeight: true
                                     Layout.rowSpan: 1
                                     Layout.columnSpan: 2
                                     txt_color: "#ff5714"
                                     bg_color: "#0f0f0f"

                                     onClicked: uniClick(this.text, '+')

                                }

                                CalcButton {
                                     text: "\uE94E"
                                     Layout.fillWidth: true
                                     Layout.fillHeight: true
                                     Layout.rowSpan: 1
                                     Layout.columnSpan: 4
                                     bg_color: "#fc4c00"
                                     txt_color: "white"

                                     onClicked: {
                                         computed = true;
                                         Calculator.compute(bg_problem)
                                     }

                                }





                           }

                      }

                      Rectangle { // numbers
                           Layout.fillWidth: true
                           Layout.maximumWidth: 620
                           Layout.fillHeight: true
                           Layout.minimumHeight: 300
                           Layout.alignment: Qt.AlignRight
                           color: "#ff5714"

                           GridLayout  {
                               anchors.fill: parent
                               anchors.margins: 1
                               rowSpacing: 1
                               columnSpacing: 1
                               columns: 3


                                   CalcButton {
                                        text: "7"
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        Layout.rowSpan: 1
                                        Layout.columnSpan: 1
                                         txt_color: "#f1f1f1"
                                         bg_color: "#0f0f0f"

                                        onClicked: btn_click(this.text)

                                   }
                                   CalcButton {
                                        text: "8"
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        Layout.rowSpan: 1
                                        Layout.columnSpan: 1
                                         txt_color: "#f1f1f1"
                                         bg_color: "#0f0f0f"

                                        onClicked: btn_click(this.text)

                                   }
                                    CalcButton {
                                        text: "9"
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        Layout.rowSpan: 1
                                        Layout.columnSpan: 1
                                         txt_color: "#f1f1f1"
                                         bg_color: "#0f0f0f"

                                        onClicked: btn_click(this.text)

                                   }
                                   CalcButton {
                                        text: "4"
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        Layout.rowSpan: 1
                                        Layout.columnSpan: 1
                                         txt_color: "#f1f1f1"
                                         bg_color: "#0f0f0f"

                                        onClicked: btn_click(this.text)

                                   }
                                   CalcButton {
                                        text: "5"
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        Layout.rowSpan: 1
                                        Layout.columnSpan: 1
                                         txt_color: "#f1f1f1"
                                         bg_color: "#0f0f0f"

                                        onClicked: btn_click(this.text)

                                   }
                                   CalcButton {
                                        text: "6"
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        Layout.rowSpan: 1
                                        Layout.columnSpan: 1
                                         txt_color: "#f1f1f1"
                                         bg_color: "#0f0f0f"

                                        onClicked: btn_click(this.text)

                                   }
                                    CalcButton {
                                        text: "1"
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        Layout.rowSpan: 1
                                        Layout.columnSpan: 1
                                         txt_color: "#f1f1f1"
                                         bg_color: "#0f0f0f"

                                        onClicked: btn_click(this.text)

                                   }
                                   CalcButton {
                                        text: "2"
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        Layout.rowSpan: 1
                                        Layout.columnSpan: 1
                                         txt_color: "#f1f1f1"
                                         bg_color: "#0f0f0f"

                                        onClicked: btn_click(this.text)

                                   }
                                   CalcButton {
                                        text: "3"
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        Layout.rowSpan: 1
                                        Layout.columnSpan: 1
                                         txt_color: "#f1f1f1"
                                         bg_color: "#0f0f0f"

                                        onClicked: btn_click(this.text)

                                   }

                                   CalcButton {
                                        text: "00"
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        Layout.rowSpan: 1
                                        Layout.columnSpan: 1
                                        bg_color: "#0f0f0f"
                                        txt_color: "white"

                                        onClicked: btn_click(this.text)

                                   }

                                   CalcButton {
                                        text: "0"
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        Layout.rowSpan: 1
                                        Layout.columnSpan: 1
                                         txt_color: "#f1f1f1"
                                         bg_color: "#0f0f0f"

                                        onClicked: btn_click(this.text)

                                   }
                                   CalcButton {
                                        text: "."
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        Layout.rowSpan: 1
                                        Layout.columnSpan: 1
                                         txt_color: "#f1f1f1"
                                         bg_color: "#0f0f0f"

                                        onClicked: btn_click(this.text)

                                   }




                           }


                      }


                 }
                 Rectangle { //border
                                 anchors.bottom: parent.bottom
                                 width: parent.width
                                 height: 20
                                 color: "#ff5714"
                               }

            }



        }
    }





    Connections {
        target: Calculator

        onEvaluated: {
            evaluation = _compute
        }

    }


}