import UIKit

class PokemonViewController: UIViewController {
    var url: String!
    var isPokemonCaught: Bool!

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var type1Label: UILabel!
    @IBOutlet var type2Label: UILabel!
    @IBOutlet weak var catchButton: UIButton!
    @IBOutlet weak var pokeImage: UIImageView!
    
    func capitalize(text: String) -> String {
        return text.prefix(1).uppercased() + text.dropFirst()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        nameLabel.text = ""
        numberLabel.text = ""
        type1Label.text = ""
        type2Label.text = ""

        loadPokemon()
    }

    func loadPokemon() {
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            guard let data = data else {
                return
            }

            do {
                let result = try JSONDecoder().decode(PokemonResult.self, from: data)
                DispatchQueue.main.async {
                    self.navigationItem.title = self.capitalize(text: result.name)
                    self.nameLabel.text = self.capitalize(text: result.name)
                    self.numberLabel.text = String(format: "#%03d", result.id)

                    for typeEntry in result.types {
                        if typeEntry.slot == 1 {
                            self.type1Label.text = typeEntry.type.name
                        }
                        else if typeEntry.slot == 2 {
                            self.type2Label.text = typeEntry.type.name
                        }
                    }
                    
                    self.isPokemonCaught = UserDefaults.standard.bool(forKey: "status")
                    print(self.isPokemonCaught!)
                    if self.isPokemonCaught {
                        self.catchButton.setTitle("Release", for: .normal)
                    } else {
                        self.catchButton.setTitle("Catch", for: .normal)
                    }
                }
            }
            catch let error {
                print(error)
            }
        }.resume()
    }
    
    @IBAction func toggleCatch(_ sender: Any) {
        isPokemonCaught = !isPokemonCaught
        if isPokemonCaught {
            catchButton.setTitle("Release", for: .normal)
        } else {
            catchButton.setTitle("Catch", for: .normal)
        }
        UserDefaults.standard.set(isPokemonCaught, forKey: "status")
        isPokemonCaught = UserDefaults.standard.bool(forKey: "status")
    }
    
}
