import UIKit

class ViewController: UIViewController {
    
    private let lblZahl1: UILabel =
    {
        let lblZahl1 = UILabel()
        lblZahl1.backgroundColor = .clear
        lblZahl1.textColor = .black
        return lblZahl1
    }()
    
    private let lblZahl2: UILabel =
    {
        let lblZahl2 = UILabel()
        lblZahl2.backgroundColor = .clear
        lblZahl2.textColor = .black
        return lblZahl2
    }()
    
    private let startWert: UITextField =
    {
        let startWert = UITextField()
        startWert.backgroundColor = .white
        startWert.layer.cornerRadius = 20
        startWert.borderStyle = .bezel
        startWert.layer.borderWidth = 2
        startWert.clipsToBounds = true
        startWert.placeholder = "Geben Sie anfang Zahl"
        startWert.keyboardType = .numberPad
        return startWert
    }()
    
    private let  endWert: UITextField =
    {
        let endWert = UITextField()
        endWert.backgroundColor = .white
        endWert.layer.cornerRadius = 20
        endWert.borderStyle = .bezel
        endWert.layer.borderWidth = 2
        endWert.clipsToBounds = true
        endWert.placeholder = "Geben Sie ende Zahl"
        endWert.keyboardType = .numberPad
        return endWert
    }()
    
    private let btnBerechnen: UIButton =
    {
        let btnBerechnen = UIButton()
        btnBerechnen.setTitle("Ist Primzahl", for: .normal)
        btnBerechnen.backgroundColor = .systemBlue
        btnBerechnen.setTitleColor(.white, for:.normal)
        btnBerechnen.setTitleColor(.yellow, for:.highlighted)
        btnBerechnen.layer.cornerRadius = 13
        btnBerechnen.layer.borderWidth = 3
        return btnBerechnen
    }()
    
    private let tvErgebnis: UITextView =
    {
        let tvErgebnis = UITextView()
        tvErgebnis.backgroundColor = .white
        tvErgebnis.layer.borderWidth = 1
        tvErgebnis.layer.cornerRadius = 13
        tvErgebnis.clipsToBounds = true
        tvErgebnis.textAlignment = .center
        tvErgebnis.isEditable = false
        return tvErgebnis
        
    }()
    
    private func istPrimzahl(_ p: Int )->Bool
    {
        var bool: Bool = true
        
        
        for i in 2 ... p
        {
            if(i != p){
                if(p % i == 0){
                    bool = false
                    break
                }
            }
        }
        
        return bool
    }

    
    @objc func rechnen()
    {
        tvErgebnis.text = ""
        
        
        var primzahl: Int = 0
        
        if (startWert.text != "" && endWert.text != "" ){
            if let startZahl = Int(startWert.text!), let endZahl = Int(endWert.text!){
                if(startZahl >= 3 && endZahl >= 3 && endZahl > startZahl){
                    
                    for i in startZahl ... endZahl
                    {
                        if(istPrimzahl(i) == true)
                        {
                            tvErgebnis.text += "\(i) \n"
                            primzahl += 1
                        }
                        
                    }
                    if(primzahl == 0)
                    {
                        tvErgebnis.text = "Es gibt keine Primzahl"
                        tvErgebnis.textColor = .red
                    }
                }else{
                    tvErgebnis.text = "!!! Ungueltige Wert !!!"
                    tvErgebnis.textColor = .red
                }
            }else{
                 tvErgebnis.text = "Bitte geben Sie ganze Zahlen ein !!!"
                 tvErgebnis.textColor = .red
            }
            
        }else{
            tvErgebnis.text = "Bitte fuellen Sie beide Felder aus !!!"
            tvErgebnis.textColor = .red
        
        }
        
        
        
        startWert.text = ""
        endWert.text = ""
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        var x = 15.0
        let breite = view.frame.width - (2.0 * x)
        let hoehe = 50.0
        var y = 100.0
        
        view.addSubview(lblZahl1)
        lblZahl1.text = "Anfang Zahl"
        lblZahl1.frame = CGRect(x: x, y: y, width: breite, height: hoehe)
        
        x = 150
        view.addSubview(startWert)
        startWert.frame = CGRect(x: x, y: y, width: 200, height: hoehe)
        
        x = 15
        y += 100
        view.addSubview(lblZahl2)
        lblZahl2.text = "Ende Zahl "
        lblZahl2.frame = CGRect(x: x, y: y, width: 100, height: hoehe)
        
        x = 150
        view.addSubview(endWert)
        endWert.frame = CGRect(x: x, y: y, width: 200, height: hoehe)
        
        x = 50
        y += 100
        view.addSubview(btnBerechnen)
        btnBerechnen.frame = CGRect(x: x, y: y, width: 300, height: hoehe)
        
        btnBerechnen.addTarget(self, action: #selector(rechnen), for: .touchUpInside)
        x = 70
        y += 100
        view.addSubview(tvErgebnis)
        tvErgebnis.frame = CGRect(x: 70, y: 400, width: 300, height: 200)
        tvErgebnis.textAlignment = .center
        
    }



}

