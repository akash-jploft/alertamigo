

class IncidentModal{
  final String title;
  final String imgSrc;

  IncidentModal({required this.imgSrc, required this.title});
}

List<IncidentModal> incidentList = [
  IncidentModal(imgSrc: "assets/incident_type_icon/medical.png", title: "Medical"),
  IncidentModal(imgSrc: "assets/incident_type_icon/shooting.png", title: "Shooting"),
  IncidentModal(imgSrc: "assets/incident_type_icon/abduction.png", title: "Abduction"),
  IncidentModal(imgSrc: "assets/incident_type_icon/bolt-fill.png", title: "Violence and Assault"),
  IncidentModal(imgSrc: "assets/incident_type_icon/home-2.png", title: "Domestic Violence"),
  IncidentModal(imgSrc: "assets/incident_type_icon/lock-open.png", title: "Break-In"),
  IncidentModal(imgSrc: "assets/incident_type_icon/Theft.png", title: "Robbery and Theft"),
  IncidentModal(imgSrc: "assets/incident_type_icon/trafficking.png", title: "Human Trafficking"),
  IncidentModal(imgSrc: "assets/incident_type_icon/wolf.png", title: "Animal Abuse"),
  IncidentModal(imgSrc: "assets/incident_type_icon/car.png", title: "Traffic Offence"),
  IncidentModal(imgSrc: "assets/incident_type_icon/damage.png", title: "Property Damage"),
  IncidentModal(imgSrc: "assets/incident_type_icon/dislike.png", title: "Disorderly Conduct"),
  IncidentModal(imgSrc: "assets/incident_type_icon/eye.png", title: "Suspicious Activity"),
  IncidentModal(imgSrc: "assets/incident_type_icon/flame.png", title: "Fire"),
  IncidentModal(imgSrc: "assets/incident_type_icon/droplet.png", title: "Flood"),
  IncidentModal(imgSrc: "assets/incident_type_icon/break-in.png", title: "Earthquake"),
  IncidentModal(imgSrc: "assets/incident_type_icon/add.png", title: "Other"),
];
