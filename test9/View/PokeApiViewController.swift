
import UIKit

class PokeApiViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource , UITextFieldDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewPokeModel.dataArrayPokemonList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewPokeModel.dataArrayPokemonList[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pokeTextField.text = viewPokeModel.dataArrayPokemonList[row].name
        pokeListPicker.isHidden = true
    }
    
    func setUpTextField(){
        pokeTextField.delegate = self as! UITextFieldDelegate
        pokeTextField.inputView = pokeListPicker
    }
    func textFieldDidEndEditing(_ textField: UITextField) -> Bool{
        pokeListPicker.isHidden = false
        return false
        
    }
    
    

    @IBOutlet weak var pokeTextField: UITextField!
    @IBOutlet weak var pokeListPicker: UIPickerView!
    var viewPokeModel = ViewModelPokemon()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func setUpPicker(){
            pokeListPicker.delegate = self
            pokeListPicker.dataSource = self
        }
        
       
        }
    func bind(){
        viewPokeModel.refreshData = {[weak self] () in
            DispatchQueue.main.async {
                [self] in self?.pokeListPicker.isHidden = true
            }
        }
    }
    
    
    }





