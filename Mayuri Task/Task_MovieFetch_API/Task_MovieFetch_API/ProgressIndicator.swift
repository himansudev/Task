
import UIKit


class ProgressTimer
{
    
    var string = "Loading"
    var timerCount:Int = 0
    var timer:Timer!
    
    func startTimer()
    {
        
        
        
       timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerEH), userInfo: nil, repeats: true)

    }
    
    
    func startTimer(on Label :UILabel)
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerEHLabel), userInfo: Label, repeats: true)
    }
    
    @objc func timerEHLabel(label:UIButton)
    {
        print(label) 
    }
    

    @objc func timerEH()
    {
        self.timerCount += 1
        
        if(self.timerCount < 13)
        {
           string += "."
        }
        else
        {
            string = "Loading"
            self.timerCount = 0
        }
        
        
        
        print(string)
    }
    
    func stopTimer()
    {
        timer.invalidate()
    }
}
