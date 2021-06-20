main(List<String> args) {}

abstract class IM {
  send();
}

abstract class QQ extends IM {
  send();
}

mixin WeChat on IM {
  send();
}

class WeXin extends IM with WeChat {
  @override
  send() {}
}

abstract class MyChat extends WeXin with WeChat, IM implements IM, WeChat {}
