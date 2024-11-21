import 'package:flutter/material.dart';
import 'package:praktekin/model/data_user.dart';

class SettingScreen extends StatelessWidget {
  final DataUser user = data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: InkWell(
              onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('ke detail akun')));
              },
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 2, child: Image.asset(user.image)),
                    Expanded(
                      flex: 6,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              user.email,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Pengaturan',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Card(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: AccountSettingsList(),
                  ),
                ),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: AppSettingsList(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AccountSettingsList extends StatelessWidget{
  const AccountSettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      //scrollDirection: Axis.vertical,
      children: AccountSettings.values.map((option) {
        return ListTile(
          leading: Icon(option.iconSettings),
          title: Text(option.displayName),
          trailing: Icon(Icons.arrow_forward_rounded),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('ke detail ${option.displayName}')));
          },
        );
      }).toList(),
    );
  }

}

class AppSettingsList extends StatelessWidget{
  const AppSettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      //scrollDirection: Axis.vertical,
      children: AppSettings.values.map((option) {
        return ListTile(
          leading: Icon(option.iconSettings),
          title: Text(option.displayName),
          trailing: Icon(Icons.arrow_forward_rounded),
          iconColor: getIconColor(option.displayName, context),
          textColor: getTextColor(option.displayName, context),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('ke detail ${option.displayName}')));
          },
        );
      }).toList(),
    );
  }

}

enum AccountSettings {
  personalInformation, accountSecurity, searchHistory;
}

extension AccountSettingExtension on AccountSettings{
  String get displayName {
    switch (this){
      case AccountSettings.personalInformation:
        return 'Informasi Pribadi';
      case AccountSettings.accountSecurity:
        return 'Keamanan Akun';
      case AccountSettings.searchHistory:
        return 'Riwayat Pencarian';
    }
  }

  IconData get iconSettings {
    switch (this){
      case AccountSettings.personalInformation:
        return Icons.person;
      case AccountSettings.accountSecurity:
        return Icons.lock;
      case AccountSettings.searchHistory:
        return Icons.history;
    }
  }
}

enum AppSettings {
  appSetting, termsAndCondition, privacyPolicy, rateApp, logOut
}

extension AppSettingsExtension on AppSettings{
  String get displayName {
    switch (this){
      case AppSettings.appSetting:
        return 'Pengaturan Aplikasi';
      case AppSettings.termsAndCondition:
        return 'Syarat dan Ketentuan Pengguna';
      case AppSettings.privacyPolicy:
        return 'Kebijakan Privasi';
      case AppSettings.rateApp:
        return 'Penilaian Aplikasi';
        case AppSettings.logOut:
        return 'Log out';
    }
  }

  IconData get iconSettings {
    switch (this){
      case AppSettings.appSetting:
        return Icons.settings;
      case AppSettings.termsAndCondition:
        return Icons.policy;
      case AppSettings.privacyPolicy:
        return Icons.privacy_tip_outlined;
      case AppSettings.rateApp:
        return Icons.star;
      case AppSettings.logOut:
        return Icons.logout;
    }
  }
}

Color getIconColor(String displayname, BuildContext context){
  if(displayname == 'Log out'){
    return Colors.red;
  }
  else {
    return Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white;
  }
}
Color getTextColor(String displayname, BuildContext context){
  if(displayname == 'Log out'){
    return Colors.red;
  }
  else {
    return Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white;
  }
}