import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class LawyerDetailTableRecord extends FirestoreRecord {
  LawyerDetailTableRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "aadharCard" field.
  String? _aadharCard;
  String get aadharCard => _aadharCard ?? '';
  bool hasAadharCard() => _aadharCard != null;

  // "barID" field.
  String? _barID;
  String get barID => _barID ?? '';
  bool hasBarID() => _barID != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photoURL" field.
  String? _photoURL;
  String get photoURL => _photoURL ?? '';
  bool hasPhotoURL() => _photoURL != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _aadharCard = snapshotData['aadharCard'] as String?;
    _barID = snapshotData['barID'] as String?;
    _email = snapshotData['email'] as String?;
    _photoURL = snapshotData['photoURL'] as String?;
    _userID = snapshotData['userID'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lawyerDetailTable');

  static Stream<LawyerDetailTableRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LawyerDetailTableRecord.fromSnapshot(s));

  static Future<LawyerDetailTableRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => LawyerDetailTableRecord.fromSnapshot(s));

  static LawyerDetailTableRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LawyerDetailTableRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LawyerDetailTableRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LawyerDetailTableRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LawyerDetailTableRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LawyerDetailTableRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLawyerDetailTableRecordData({
  String? aadharCard,
  String? barID,
  String? email,
  String? photoURL,
  String? userID,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? displayName,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'aadharCard': aadharCard,
      'barID': barID,
      'email': email,
      'photoURL': photoURL,
      'userID': userID,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'display_name': displayName,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class LawyerDetailTableRecordDocumentEquality
    implements Equality<LawyerDetailTableRecord> {
  const LawyerDetailTableRecordDocumentEquality();

  @override
  bool equals(LawyerDetailTableRecord? e1, LawyerDetailTableRecord? e2) {
    return e1?.aadharCard == e2?.aadharCard &&
        e1?.barID == e2?.barID &&
        e1?.email == e2?.email &&
        e1?.photoURL == e2?.photoURL &&
        e1?.userID == e2?.userID &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(LawyerDetailTableRecord? e) => const ListEquality().hash([
        e?.aadharCard,
        e?.barID,
        e?.email,
        e?.photoURL,
        e?.userID,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.displayName,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is LawyerDetailTableRecord;
}
