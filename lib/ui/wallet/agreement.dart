import 'package:flutter/material.dart';
import 'package:icpbox/generated/l10n.dart';

import 'addwallet.dart';

///协议
class AgreementPage extends StatelessWidget {
  const AgreementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Text(S().wallet6,
              style: TextStyle(fontSize: 20, color: Colors.black)),
          centerTitle: true,
          elevation: 0,
        ),
        // body: NoAddress(),
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(14, 10, 14, 10),
                    child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(13),
                        child: Text(
                            "1、您使用简书软件和/或服务，即视为您签署了本协议，表明您自愿接受本协议全部条款的约束，本协议将构成您与上海佰集科技有限公司（以下称我公司）就“简书”软件及服务（以下统称“简书”）之间具有约束力的法律文件。无论您是进入简书浏览网页，还是在简书上发布任何内容，或者是直接或通过各类方式（如站外API引用等）间接使用简书的行为，都将被视作已无条件接受本声明所涉全部内容。 2、我公司有权利对本协议进行修改，我公司将在简书相关页面公告或发送通知等方式公布修改的内容，修改后的协议一经公布即有效的代替原协议。如果您不同意本协议的修改，请立即停止访问或使用简书或取消已经获得的服务；如果您选择继续访问或使用简书，则视为您已接受本协议的修改。 3、本协议所列明的条款，并不能完全涵盖您与我公司之间所有的权利和义务。因此，我公司不定期公布的其他声明、规则、子协议等均视为本协议之补充协议，为本协议不可分割的组成部分，与本协议具有同等法律效力。 4、如本协议与简书的补充协议不一致，以补充协议内容为准。 二、帐号密码与注册、登录 1、帐号的取得 (1)您确认，在您开始使用简书时，已经具备中华人民共和国法律规定的与您行为相适应的民事行为能力。若您不具备前述与您行为相适应的民事行为能力，则您及您的监护人应依照法律规定承担因此而导致的一切后果。 (2)您注册成功后，即成为简书注册用户，用户须对在简书的注册信息的真实性、合法性、有效性承担全部责任。您可自行创建、修改昵称，但用户名和昵称的命名及使用应遵守相关法律法规并符合网络道德，不得冒充他人或恶意注册使人误认；不得利用他人的名义发布任何信息；不得恶意使用注册帐号导致其他用户误认；用户名和昵称中不能含有任何侮辱、诽谤、")))),
            Container(
              width: MediaQuery.of(context).size.width,
              // 屏幕宽度
              margin: EdgeInsets.all(17),
              height: 48,
              //在此设置
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(colors: [
                  Color(0xFF3555FF),
                  Color(0xFF3878F9),
                  Color(0xFF3B9BF2),
                ]),
              ),
              child: ElevatedButton(
                onPressed: () {
                  //跳转
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new AddWalletPage(),
                      ));
                },
                child: Text(
                  S().wallet7,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ButtonStyle(
                  //去除阴影
                  elevation: MaterialStateProperty.all(0),
                  //将按钮背景设置为透明
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
              ),
            )
          ],
        ));
  }
}
