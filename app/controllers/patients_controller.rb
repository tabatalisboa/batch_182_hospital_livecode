require_relative '../views/patients_view'

class PatientsController
  def initialize(patient_repository, room_repository)
    @patient_repository = patient_repository
    @room_repository = room_repository
    @view = PatientsView.new
  end

  def create
    name = @view.ask_name
    age = @view.ask_age
    room_number = @view.ask_room_number
    room = @room_repository.find_by_number(room_number)
    patient = Patient.new(name: name, age: age)
    room.add_patient(patient)
    @patient_repository.add(patient)
  end

  def list
    patients = @patient_repository.all
    @view.list(patients)
  end
end