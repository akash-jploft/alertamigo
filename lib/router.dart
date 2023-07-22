import 'package:alertamigo_app/model/contact_model.dart';
import 'package:alertamigo_app/pages/account_creation_page/account_creation_name_page.dart';
import 'package:alertamigo_app/pages/account_creation_page/date_of_birth_page.dart';
import 'package:alertamigo_app/pages/account_creation_page/email_input_page.dart';
import 'package:alertamigo_app/pages/account_creation_page/permission_page.dart';
import 'package:alertamigo_app/pages/account_creation_page/picture_selection_page.dart';
import 'package:alertamigo_app/pages/main_page/alerts_page/pages/incident_detail_page.dart';
import 'package:alertamigo_app/pages/main_page/alerts_page/pages/incident_posts_page.dart';
import 'package:alertamigo_app/pages/main_page/alerts_page/pages/report_incident_page.dart';
import 'package:alertamigo_app/pages/main_page/emergency_contacts_page/pages/contact_detail_page.dart';
import 'package:alertamigo_app/pages/main_page/home_page/add_alert_page/preview_page.dart';
import 'package:alertamigo_app/pages/main_page/home_page/add_alert_page/report_creation_page.dart';
import 'package:alertamigo_app/pages/main_page/home_page/add_alert_page/audio_incident_page.dart';
import 'package:alertamigo_app/pages/main_page/main_page.dart';
import 'package:alertamigo_app/pages/main_page/profile_page/pages/about_page.dart';
import 'package:alertamigo_app/pages/main_page/profile_page/pages/account_settings_page.dart';
import 'package:alertamigo_app/pages/main_page/profile_page/pages/delete_account_page.dart';
import 'package:alertamigo_app/pages/main_page/profile_page/pages/edit_profile_page.dart';
import 'package:alertamigo_app/pages/main_page/profile_page/pages/feature_request_page.dart';
import 'package:alertamigo_app/pages/main_page/profile_page/pages/help_center.dart';
import 'package:alertamigo_app/pages/main_page/profile_page/pages/location_sharing_page.dart';
import 'package:alertamigo_app/pages/main_page/profile_page/pages/report_problem_page.dart';
import 'package:alertamigo_app/pages/main_page/profile_page/pages/verify_new_emial_page.dart';
import 'package:alertamigo_app/pages/sign_up_page/create_passcode_page.dart';
import 'package:alertamigo_app/pages/sign_up_page/face_id_page.dart';
import 'package:alertamigo_app/pages/sign_up_page/mobile_input_page.dart';
import 'package:alertamigo_app/pages/sign_up_page/verify_number_page.dart';
import 'package:alertamigo_app/pages/sign_up_page/verify_passcode_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case ContactDetailPage.routeName:
      ContactModel contact = routeSettings.arguments as ContactModel;
      return MaterialPageRoute(
        builder: (_) => ContactDetailPage(
          contact: contact,
        ),
      );

    case EditProfilePage.routeName:
      return MaterialPageRoute(
        builder: (_) => const EditProfilePage(),
      );

    case IncidentPostsPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const IncidentPostsPage(),
      );

    case PreviewPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const PreviewPage(),
      );

    case ReportCreationPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const ReportCreationPage(),
      );

    case IncidentDetailPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const IncidentDetailPage(),
      );

    case AccountSettingsPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const AccountSettingsPage(),
      );

    case AboutPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const AboutPage(),
      );

    case LocationSharingPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const LocationSharingPage(),
      );

    case HelpCentrePage.routeName:
      return MaterialPageRoute(
        builder: (_) => const HelpCentrePage(),
      );

    case MobileInputPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const MobileInputPage(),
      );

    case VerifyNumberPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const VerifyNumberPage(),
      );

    case CreatePasscodePage.routeName:
      return MaterialPageRoute(
        builder: (_) => const CreatePasscodePage(),
      );

    case VerifyPasscodePage.routeName:
      return MaterialPageRoute(
        builder: (_) => const VerifyPasscodePage(),
      );

    case FaceIdPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const FaceIdPage(),
      );

    case AccountCreationNamePage.routeName:
      return MaterialPageRoute(
        builder: (_) => const AccountCreationNamePage(),
      );

    case DateOfBirthPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const DateOfBirthPage(),
      );

    case EmailInputPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const EmailInputPage(),
      );

    case PictureSectionPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const PictureSectionPage(),
      );

    case PermissionsPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const PermissionsPage(),
      );

    case MainPage.routeName:
      int  pageIdx = routeSettings.arguments as int;
      return MaterialPageRoute(
        builder: (_) =>  MainPage(pageIndex: pageIdx),
      );

    case AudioIncidentCreationPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const AudioIncidentCreationPage(),
      );

    case ReportProblemPage.routeName:
      return MaterialPageRoute(
        builder: (_) =>  const ReportProblemPage(),
      );

    case DeleteAccountPage.routeName:
      return MaterialPageRoute(
        builder: (_) =>  const DeleteAccountPage(),
      );

    case ReportIncidentPage.routeName:
      return MaterialPageRoute(
        builder: (_) =>  const ReportIncidentPage(),
      );

      case VerifyNewEmailPage.routeName:
      return MaterialPageRoute(
        builder: (_) =>  const VerifyNewEmailPage(),
      );

      case FeatureRequestPage.routeName:
      return MaterialPageRoute(
        builder: (_) =>  const FeatureRequestPage(),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("route not implemented "),
                ),
              ));
  }
}
