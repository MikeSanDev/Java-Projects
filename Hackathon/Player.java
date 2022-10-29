import java.util.Random;

public class Player {


    public int getRandomCard() {

        Random random = new Random();
        int random = (int)(Math.random() * 51 + 1);
        return random;
    }

}