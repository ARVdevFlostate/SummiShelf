const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onUserDeleted = functions.auth.user().onDelete(async (user) => {
  let firestore = admin.firestore();
  let userRef = firestore.doc("users/" + user.uid);
  await firestore
    .collectionGroup("updations")
    .where("uid", "==", user.uid)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(`Deleting document ${doc.id} from collection updations`);
        await doc.ref.delete();
      }
    });
  await firestore.collection("users").doc(user.uid).delete();
  await firestore
    .collection("books")
    .where("uid", "==", user.uid)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(`Deleting document ${doc.id} from collection books`);
        await doc.ref.delete();
      }
    });
  await firestore
    .collection("notes")
    .where("uid", "==", user.uid)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(`Deleting document ${doc.id} from collection notes`);
        await doc.ref.delete();
      }
    });
});
