public class Brain {
  String guessPhrase, targetPhrase;
  String chars = "abcdefghijklmnopqrstuvwxyz 1234567890;,.'";
  
  public Brain(String target) {
    targetPhrase = target;
    guessPhrase = "";
  }
  
  //generates the guess phrase
  public void makeGuess() {
    for (int i = 0; i < targetPhrase.length(); i++) {
      int randomIn = (int)random(chars.length());
      guessPhrase = guessPhrase.concat(chars.charAt(randomIn) + "");
    }
  }
   
  public void mutate() {
    String g = guessPhrase;
    char[] tempArr = g.toCharArray();
    float mutationRate = 0.01;
    
    for (int i = 0; i < guessPhrase.length(); i++) {
      float rand = random(1);
      if (rand < mutationRate) {
        tempArr[i] = chars.charAt((int)random(chars.length()));
      }
    }
    g = String.valueOf(tempArr);
    guessPhrase = g;
  }
  
  //gets genes from two parents
  public Brain crossover(Sequencer parentB) {
    String guessB = parentB.brain.guessPhrase, guessA = guessPhrase;
    Brain newBrain = new Brain(target);
    newBrain.makeGuess();
    char[] guess = newBrain.guessPhrase.toCharArray();
    
    float mid = random(target.length());
    
    for (int i = 0; i < target.length(); i++) {
      if (i < mid) {
        guess[i] = guessA.charAt(i);
      } else {
        guess[i] = guessB.charAt(i);
      }
    }
    newBrain.guessPhrase = String.valueOf(guess);
    return newBrain;
  }
}
