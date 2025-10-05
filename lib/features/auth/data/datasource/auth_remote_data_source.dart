import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devvibe_template/features/auth/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRemoteDataSource{
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final GoogleSignIn googleSignIn;

  AuthRemoteDataSource({required this.firebaseAuth, required this.firebaseFirestore, required this.googleSignIn});

  UserModel _mapFirebaseUser(User fbUser, Map<String, dynamic>? data) {
    return UserModel(
      id: fbUser.uid,
      email: fbUser.email,
      displayName: fbUser.displayName,
      avatarUrl: fbUser.photoURL ?? data?['photoUrl'],
    );
  }

  Future<UserModel> signInWithGoogle() async {
    final googleUser = await googleSignIn.authenticate();

    final credential = GoogleAuthProvider.credential(
      idToken: googleUser.authentication.idToken,
    );

    final userCred = await firebaseAuth.signInWithCredential(credential);
    final User fbUser = userCred.user!;

    final doc = await firebaseFirestore.collection('users').doc(fbUser.uid).get();
    final userModel = _mapFirebaseUser(fbUser, doc.data());

    await firebaseFirestore.collection('users').doc(fbUser.uid).set(
      userModel.toJson(),
      SetOptions(merge: true),
    );

    return userModel;
  }


  Future<UserModel?> getCurrentUser() async {
    final User? fbUser = firebaseAuth.currentUser;
    if (fbUser == null) return null;

    final doc = await firebaseFirestore.collection('users').doc(fbUser.uid).get();
    return _mapFirebaseUser(fbUser, doc.data());
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }
}
