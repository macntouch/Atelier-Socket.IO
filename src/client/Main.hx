package client;

import js.Lib;
import js.Browser;
import js.browser.SocketIo;
import js.html.Audio;
import js.html.Element;
import js.html.InputElement;

import js.support.DynamicObject;

using StringTools;

class Main
{
  static inline var FADE_TIME = 0.2; //s
  static inline var TYPING_TIMER_LENGTH = 400; // ms
  var COLORS = [
    '#e21400', '#91580f', '#f8a700', '#f78b00',
    '#58dc00', '#287b00', '#a8f07a', '#4ae8c4',
    '#3b88eb', '#3824aa', '#a700ff', '#d300e7'
  ];
  var elementData = new Map<Element, DynamicObject<String>>();

  var usernameInput: InputElement;
  var messages: Element;
  var inputMessage: InputElement;
  var loginPage: Element;
  var chatPage: Element;
  var participantList: Element;
  var smileyContainer: Element;

  var username: String;
  var connected = false;
  var typing = false;
  var lastTypingTime: Float;
  var currentInput: Element;

  var urlRegExp: EReg;
  var smileyRegExp: EReg;
  var whisperRegExp: EReg;

  var socket: Socket;

  public static function main(){
    new Main();
  }

  public function new()
  {
    usernameInput = cast Browser.document.getElementsByClassName('usernameInput')[0];
    messages = Browser.document.getElementsByClassName('messages')[0];
    inputMessage = cast Browser.document.getElementsByClassName('inputMessage')[0];
    loginPage = Browser.document.getElementsByClassName('login page')[0];
    chatPage = Browser.document.getElementsByClassName('chat page')[0];
    participantList = Browser.document.querySelector(".participants ul");
    smileyContainer = Browser.document.getElementsByClassName("smileyContainer")[0];
    Browser.document.getElementsByClassName("smileyButton")[0].onclick = function(e){
      smileyContainer.style.animation = 'fadeIn '+FADE_TIME+'s';
    };
	currentInput = usernameInput;
	
    urlRegExp = ~/(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig;
    smileyRegExp = ~/(\]:\)|[:;][\S]+|8\)|:.+:|\S\.\S{1,2}|<3\)?)/g;
    whisperRegExp = ~/^@(.+?):/;
    
    // TODO Complete
  }
}
