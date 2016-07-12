RSpec.shared_context 'request profiles' do

  let(:audi_a3){ Cars::CarModel.joins(:car_manufacturer).where(name: "A3", car_manufacturers: { name: "Audi"}).first! }
  let(:dacia_duster){ Cars::CarModel.joins(:car_manufacturer).where(name: "DUSTER", car_manufacturers: { name: "Dacia"}).first! }
  let(:peugeot_partner){ Cars::CarModel.joins(:car_manufacturer).where(name: "PARTNER", car_manufacturers: { name: "Peugeot"}).first!}
  let(:renault_clio){ Cars::CarModel.joins(:car_manufacturer).where(name: "CLIO", car_manufacturers: { name: "Renault"}).first! }
  let(:tesla_model_s){ Cars::CarModel.joins(:car_manufacturer).where(name: "MODEL S", car_manufacturers: { name: "Tesla"}).first! }
  let(:toyota_prius){ Cars::CarModel.joins(:car_manufacturer).where(name: "PRIUS", car_manufacturers: { name: "Toyota"}).first! }




  let(:alice_request){
    vehicle = build_stubbed(:vehicle, car_model: renault_clio, power: 50)
    policy_owner = build_stubbed(:policy_owner, birthdate: 18.years.ago.to_date)
    main_driver = build_stubbed(:driver, person: policy_owner.person)

    build_stubbed(:contract_request, vehicle: vehicle, policy_owner: policy_owner, main_driver: main_driver, usual_drivers: [main_driver])
  }

  let(:bob_request){
    vehicle = build_stubbed(:vehicle, car_model: audi_a3, power: 100)
    policy_owner = build_stubbed(:policy_owner, birthdate: 45.years.ago.to_date)
    main_driver = build_stubbed(:driver, person: policy_owner.person)

    build_stubbed(:contract_request, vehicle: vehicle, policy_owner: policy_owner, main_driver: main_driver, usual_drivers: [main_driver])
  }

  let(:cedric_request){
    vehicle = build_stubbed(:vehicle, car_model: dacia_duster, power: 70)
    policy_owner = build_stubbed(:policy_owner, birthdate: 35.years.ago.to_date)
    main_driver = build_stubbed(:driver, person: policy_owner.person)

    build_stubbed(:contract_request, vehicle: vehicle, policy_owner: policy_owner, main_driver: main_driver, usual_drivers: [main_driver])

  }

  let(:david_request){
    vehicle = build_stubbed(:vehicle, car_model: peugeot_partner, power: 70)
    policy_owner = build_stubbed(:policy_owner, birthdate: 40.years.ago.to_date)
    main_driver = build_stubbed(:driver, person: policy_owner.person)
    child = build_stubbed(:person, birthdate: 23.years.ago.to_date)
    child_driver = build_stubbed(:driver, person: child)


    build_stubbed(:contract_request, vehicle: vehicle, policy_owner: policy_owner, main_driver: main_driver, usual_drivers: [main_driver, child_driver])
  }

  let(:emilie_request){
    vehicle = build_stubbed(:vehicle, car_model: tesla_model_s, power: 95)
    policy_owner = build_stubbed(:policy_owner, birthdate: 27.years.ago.to_date)
    main_driver = build_stubbed(:driver, person: policy_owner.person)

    build_stubbed(:contract_request, vehicle: vehicle, policy_owner: policy_owner, main_driver: main_driver, usual_drivers: [main_driver])
  }


  let(:francis_request){
    vehicle = build_stubbed(:vehicle, car_model: toyota_prius, power: 150)
    policy_owner = build_stubbed(:policy_owner, birthdate: 55.years.ago.to_date)
    main_driver = build_stubbed(:driver, person: policy_owner.person)

    build_stubbed(:contract_request, vehicle: vehicle, policy_owner: policy_owner, main_driver: main_driver, usual_drivers: [main_driver])
  }






end
