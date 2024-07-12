<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lobster&display=swap">
<!<!-- sdf 
<link href="Estilos/paquetes.css" rel="stylesheet" type="text/css" media="all">-->
<link href="Estilos/style.css.css" rel="stylesheet" type="text/css" media="all">
<style type="text/css">
            #monto {
            width: 50px;
	    text-align: center;
	    font-weight: bold;
	    color: red;
            
        }
/*############################################################*/
html, body {
          height: 100%;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
}

body {
  background: url(https://i.pinimg.com/originals/44/6e/3b/446e3b79395a287ca32f7977dd83b290.jpg);
  background-size: cover;
}

.firefly {
  position: fixed;
  left: 50%;
  top: 50%;
  width: 0.4vw;
  height: 0.4vw;
  margin: -0.2vw 0 0 9.8vw;
  animation: ease 200s alternate infinite;
  pointer-events: none;
}
.firefly::before, .firefly::after {
  content: "";
  position: absolute;
  width: 100%;
  height: 100%;
  border-radius: 50%;
  transform-origin: -10vw;
}
.firefly::before {
  background: black;
  opacity: 0.4;
  animation: drift ease alternate infinite;
}
.firefly::after {
  background: white;
  opacity: 0;
  box-shadow: 0 0 0vw 0vw yellow;
  animation: drift ease alternate infinite, flash ease infinite;
}

.firefly:nth-child(1) {
  animation-name: move1;
}
.firefly:nth-child(1)::before {
  animation-duration: 18s;
}
.firefly:nth-child(1)::after {
  animation-duration: 18s, 6172ms;
  animation-delay: 0ms, 5037ms;
}

@keyframes move1 {
  0% {
    transform: translateX(-32vw) translateY(-35vh) scale(0.85);
  }
  4% {
    transform: translateX(5vw) translateY(12vh) scale(0.32);
  }
  8% {
    transform: translateX(-40vw) translateY(-18vh) scale(0.29);
  }
  12% {
    transform: translateX(-7vw) translateY(-1vh) scale(0.49);
  }
  16% {
    transform: translateX(19vw) translateY(19vh) scale(0.71);
  }
  20% {
    transform: translateX(-37vw) translateY(30vh) scale(0.75);
  }
  24% {
    transform: translateX(-4vw) translateY(31vh) scale(0.41);
  }
  28% {
    transform: translateX(35vw) translateY(24vh) scale(0.73);
  }
  32% {
    transform: translateX(14vw) translateY(-37vh) scale(0.8);
  }
  36% {
    transform: translateX(-17vw) translateY(32vh) scale(0.72);
  }
  40% {
    transform: translateX(-11vw) translateY(10vh) scale(0.31);
  }
  44% {
    transform: translateX(-46vw) translateY(-6vh) scale(0.34);
  }
  48% {
    transform: translateX(26vw) translateY(11vh) scale(0.58);
  }
  52% {
    transform: translateX(7vw) translateY(1vh) scale(0.9);
  }
  56% {
    transform: translateX(11vw) translateY(40vh) scale(0.39);
  }
  60% {
    transform: translateX(36vw) translateY(18vh) scale(0.87);
  }
  64% {
    transform: translateX(22vw) translateY(40vh) scale(0.48);
  }
  68% {
    transform: translateX(24vw) translateY(-49vh) scale(0.83);
  }
  72% {
    transform: translateX(0vw) translateY(-13vh) scale(0.33);
  }
  76% {
    transform: translateX(-49vw) translateY(13vh) scale(0.84);
  }
  80% {
    transform: translateX(0vw) translateY(36vh) scale(0.51);
  }
  84% {
    transform: translateX(30vw) translateY(-9vh) scale(0.85);
  }
  88% {
    transform: translateX(26vw) translateY(26vh) scale(0.44);
  }
  92% {
    transform: translateX(-44vw) translateY(-13vh) scale(0.26);
  }
  96% {
    transform: translateX(2vw) translateY(-49vh) scale(0.97);
  }
  100% {
    transform: translateX(5vw) translateY(22vh) scale(0.84);
  }
}
.firefly:nth-child(2) {
  animation-name: move2;
}
.firefly:nth-child(2)::before {
  animation-duration: 18s;
}
.firefly:nth-child(2)::after {
  animation-duration: 18s, 8770ms;
  animation-delay: 0ms, 3615ms;
}

@keyframes move2 {
  0% {
    transform: translateX(-14vw) translateY(14vh) scale(0.86);
  }
  5.2631578947% {
    transform: translateX(49vw) translateY(45vh) scale(0.86);
  }
  10.5263157895% {
    transform: translateX(50vw) translateY(22vh) scale(0.28);
  }
  15.7894736842% {
    transform: translateX(-14vw) translateY(46vh) scale(0.98);
  }
  21.0526315789% {
    transform: translateX(-42vw) translateY(-11vh) scale(0.8);
  }
  26.3157894737% {
    transform: translateX(-25vw) translateY(17vh) scale(0.65);
  }
  31.5789473684% {
    transform: translateX(38vw) translateY(14vh) scale(0.81);
  }
  36.8421052632% {
    transform: translateX(10vw) translateY(39vh) scale(0.72);
  }
  42.1052631579% {
    transform: translateX(49vw) translateY(36vh) scale(0.58);
  }
  47.3684210526% {
    transform: translateX(47vw) translateY(0vh) scale(0.52);
  }
  52.6315789474% {
    transform: translateX(-47vw) translateY(-39vh) scale(0.88);
  }
  57.8947368421% {
    transform: translateX(-7vw) translateY(-15vh) scale(0.97);
  }
  63.1578947368% {
    transform: translateX(49vw) translateY(-9vh) scale(0.7);
  }
  68.4210526316% {
    transform: translateX(27vw) translateY(8vh) scale(0.91);
  }
  73.6842105263% {
    transform: translateX(12vw) translateY(35vh) scale(0.8);
  }
  78.9473684211% {
    transform: translateX(30vw) translateY(-9vh) scale(0.28);
  }
  84.2105263158% {
    transform: translateX(-6vw) translateY(-47vh) scale(0.41);
  }
  89.4736842105% {
    transform: translateX(50vw) translateY(-6vh) scale(0.93);
  }
  94.7368421053% {
    transform: translateX(-48vw) translateY(-44vh) scale(0.98);
  }
  100% {
    transform: translateX(18vw) translateY(34vh) scale(0.49);
  }
}
.firefly:nth-child(3) {
  animation-name: move3;
}
.firefly:nth-child(3)::before {
  animation-duration: 10s;
}
.firefly:nth-child(3)::after {
  animation-duration: 10s, 8485ms;
  animation-delay: 0ms, 7346ms;
}

@keyframes move3 {
  0% {
    transform: translateX(-17vw) translateY(-4vh) scale(0.96);
  }
  3.8461538462% {
    transform: translateX(-35vw) translateY(-5vh) scale(0.76);
  }
  7.6923076923% {
    transform: translateX(0vw) translateY(-42vh) scale(0.65);
  }
  11.5384615385% {
    transform: translateX(47vw) translateY(-44vh) scale(0.65);
  }
  15.3846153846% {
    transform: translateX(-24vw) translateY(-44vh) scale(0.81);
  }
  19.2307692308% {
    transform: translateX(22vw) translateY(29vh) scale(0.56);
  }
  23.0769230769% {
    transform: translateX(39vw) translateY(-8vh) scale(0.68);
  }
  26.9230769231% {
    transform: translateX(48vw) translateY(-10vh) scale(0.32);
  }
  30.7692307692% {
    transform: translateX(-34vw) translateY(0vh) scale(0.81);
  }
  34.6153846154% {
    transform: translateX(32vw) translateY(26vh) scale(0.43);
  }
  38.4615384615% {
    transform: translateX(27vw) translateY(47vh) scale(0.26);
  }
  42.3076923077% {
    transform: translateX(-34vw) translateY(42vh) scale(0.42);
  }
  46.1538461538% {
    transform: translateX(40vw) translateY(23vh) scale(0.93);
  }
  50% {
    transform: translateX(-13vw) translateY(-29vh) scale(0.56);
  }
  53.8461538462% {
    transform: translateX(-24vw) translateY(-46vh) scale(0.79);
  }
  57.6923076923% {
    transform: translateX(-42vw) translateY(-49vh) scale(0.35);
  }
  61.5384615385% {
    transform: translateX(20vw) translateY(48vh) scale(0.5);
  }
  65.3846153846% {
    transform: translateX(40vw) translateY(-25vh) scale(0.99);
  }
  69.2307692308% {
    transform: translateX(9vw) translateY(2vh) scale(0.63);
  }
  73.0769230769% {
    transform: translateX(-24vw) translateY(10vh) scale(0.39);
  }
  76.9230769231% {
    transform: translateX(1vw) translateY(-33vh) scale(0.45);
  }
  80.7692307692% {
    transform: translateX(41vw) translateY(-35vh) scale(0.52);
  }
  84.6153846154% {
    transform: translateX(46vw) translateY(10vh) scale(0.98);
  }
  88.4615384615% {
    transform: translateX(26vw) translateY(-18vh) scale(0.92);
  }
  92.3076923077% {
    transform: translateX(45vw) translateY(36vh) scale(0.53);
  }
  96.1538461538% {
    transform: translateX(38vw) translateY(-13vh) scale(0.84);
  }
  100% {
    transform: translateX(-4vw) translateY(-15vh) scale(0.52);
  }
}
.firefly:nth-child(4) {
  animation-name: move4;
}
.firefly:nth-child(4)::before {
  animation-duration: 15s;
}
.firefly:nth-child(4)::after {
  animation-duration: 15s, 10052ms;
  animation-delay: 0ms, 1328ms;
}

@keyframes move4 {
  0% {
    transform: translateX(3vw) translateY(31vh) scale(0.68);
  }
  3.7037037037% {
    transform: translateX(-48vw) translateY(15vh) scale(0.73);
  }
  7.4074074074% {
    transform: translateX(-32vw) translateY(-34vh) scale(0.39);
  }
  11.1111111111% {
    transform: translateX(-45vw) translateY(27vh) scale(0.73);
  }
  14.8148148148% {
    transform: translateX(-31vw) translateY(-47vh) scale(0.32);
  }
  18.5185185185% {
    transform: translateX(37vw) translateY(-11vh) scale(0.57);
  }
  22.2222222222% {
    transform: translateX(4vw) translateY(49vh) scale(0.71);
  }
  25.9259259259% {
    transform: translateX(44vw) translateY(19vh) scale(0.48);
  }
  29.6296296296% {
    transform: translateX(-31vw) translateY(33vh) scale(0.5);
  }
  33.3333333333% {
    transform: translateX(-33vw) translateY(-18vh) scale(0.9);
  }
  37.037037037% {
    transform: translateX(-1vw) translateY(41vh) scale(0.37);
  }
  40.7407407407% {
    transform: translateX(-48vw) translateY(10vh) scale(0.9);
  }
  44.4444444444% {
    transform: translateX(-48vw) translateY(33vh) scale(0.64);
  }
  48.1481481481% {
    transform: translateX(48vw) translateY(-7vh) scale(0.64);
  }
  51.8518518519% {
    transform: translateX(39vw) translateY(-7vh) scale(0.92);
  }
  55.5555555556% {
    transform: translateX(-27vw) translateY(-26vh) scale(0.5);
  }
  59.2592592593% {
    transform: translateX(3vw) translateY(43vh) scale(0.78);
  }
  62.962962963% {
    transform: translateX(-8vw) translateY(4vh) scale(0.52);
  }
  66.6666666667% {
    transform: translateX(-1vw) translateY(24vh) scale(0.74);
  }
  70.3703703704% {
    transform: translateX(-34vw) translateY(42vh) scale(0.39);
  }
  74.0740740741% {
    transform: translateX(28vw) translateY(-15vh) scale(0.64);
  }
  77.7777777778% {
    transform: translateX(41vw) translateY(-34vh) scale(0.49);
  }
  81.4814814815% {
    transform: translateX(-38vw) translateY(5vh) scale(0.26);
  }
  85.1851851852% {
    transform: translateX(8vw) translateY(1vh) scale(0.71);
  }
  88.8888888889% {
    transform: translateX(26vw) translateY(3vh) scale(0.49);
  }
  92.5925925926% {
    transform: translateX(-22vw) translateY(-14vh) scale(0.8);
  }
  96.2962962963% {
    transform: translateX(-49vw) translateY(11vh) scale(0.41);
  }
  100% {
    transform: translateX(-7vw) translateY(47vh) scale(0.76);
  }
}
.firefly:nth-child(5) {
  animation-name: move5;
}
.firefly:nth-child(5)::before {
  animation-duration: 9s;
}
.firefly:nth-child(5)::after {
  animation-duration: 9s, 7648ms;
  animation-delay: 0ms, 4450ms;
}

@keyframes move5 {
  0% {
    transform: translateX(48vw) translateY(-37vh) scale(0.62);
  }
  5.8823529412% {
    transform: translateX(-30vw) translateY(47vh) scale(0.81);
  }
  11.7647058824% {
    transform: translateX(-25vw) translateY(-14vh) scale(0.62);
  }
  17.6470588235% {
    transform: translateX(26vw) translateY(-5vh) scale(0.58);
  }
  23.5294117647% {
    transform: translateX(3vw) translateY(-43vh) scale(0.27);
  }
  29.4117647059% {
    transform: translateX(-21vw) translateY(-24vh) scale(0.27);
  }
  35.2941176471% {
    transform: translateX(8vw) translateY(46vh) scale(0.7);
  }
  41.1764705882% {
    transform: translateX(-35vw) translateY(-45vh) scale(0.52);
  }
  47.0588235294% {
    transform: translateX(-47vw) translateY(22vh) scale(0.76);
  }
  52.9411764706% {
    transform: translateX(-35vw) translateY(-48vh) scale(0.65);
  }
  58.8235294118% {
    transform: translateX(-20vw) translateY(-43vh) scale(0.41);
  }
  64.7058823529% {
    transform: translateX(18vw) translateY(38vh) scale(0.61);
  }
  70.5882352941% {
    transform: translateX(5vw) translateY(44vh) scale(0.44);
  }
  76.4705882353% {
    transform: translateX(-14vw) translateY(15vh) scale(0.63);
  }
  82.3529411765% {
    transform: translateX(37vw) translateY(-22vh) scale(0.29);
  }
  88.2352941176% {
    transform: translateX(41vw) translateY(41vh) scale(0.37);
  }
  94.1176470588% {
    transform: translateX(38vw) translateY(-25vh) scale(0.85);
  }
  100% {
    transform: translateX(22vw) translateY(-9vh) scale(0.35);
  }
}
.firefly:nth-child(6) {
  animation-name: move6;
}
.firefly:nth-child(6)::before {
  animation-duration: 11s;
}
.firefly:nth-child(6)::after {
  animation-duration: 11s, 10209ms;
  animation-delay: 0ms, 5839ms;
}

@keyframes move6 {
  0% {
    transform: translateX(50vw) translateY(2vh) scale(0.53);
  }
  4% {
    transform: translateX(23vw) translateY(17vh) scale(0.76);
  }
  8% {
    transform: translateX(-3vw) translateY(42vh) scale(0.93);
  }
  12% {
    transform: translateX(-20vw) translateY(49vh) scale(0.94);
  }
  16% {
    transform: translateX(-44vw) translateY(-47vh) scale(0.28);
  }
  20% {
    transform: translateX(36vw) translateY(-1vh) scale(0.53);
  }
  24% {
    transform: translateX(-10vw) translateY(38vh) scale(0.6);
  }
  28% {
    transform: translateX(34vw) translateY(-13vh) scale(0.55);
  }
  32% {
    transform: translateX(-5vw) translateY(16vh) scale(0.57);
  }
  36% {
    transform: translateX(-49vw) translateY(-47vh) scale(0.61);
  }
  40% {
    transform: translateX(-15vw) translateY(-18vh) scale(0.73);
  }
  44% {
    transform: translateX(14vw) translateY(-44vh) scale(0.74);
  }
  48% {
    transform: translateX(-28vw) translateY(35vh) scale(0.48);
  }
  52% {
    transform: translateX(-11vw) translateY(-20vh) scale(0.61);
  }
  56% {
    transform: translateX(27vw) translateY(33vh) scale(0.76);
  }
  60% {
    transform: translateX(-37vw) translateY(-34vh) scale(0.32);
  }
  64% {
    transform: translateX(5vw) translateY(-6vh) scale(0.39);
  }
  68% {
    transform: translateX(5vw) translateY(1vh) scale(0.45);
  }
  72% {
    transform: translateX(11vw) translateY(-20vh) scale(0.35);
  }
  76% {
    transform: translateX(-7vw) translateY(35vh) scale(0.59);
  }
  80% {
    transform: translateX(-44vw) translateY(20vh) scale(0.44);
  }
  84% {
    transform: translateX(-23vw) translateY(6vh) scale(0.91);
  }
  88% {
    transform: translateX(41vw) translateY(-42vh) scale(0.59);
  }
  92% {
    transform: translateX(32vw) translateY(28vh) scale(0.37);
  }
  96% {
    transform: translateX(31vw) translateY(9vh) scale(0.49);
  }
  100% {
    transform: translateX(-21vw) translateY(0vh) scale(0.9);
  }
}
.firefly:nth-child(7) {
  animation-name: move7;
}
.firefly:nth-child(7)::before {
  animation-duration: 15s;
}
.firefly:nth-child(7)::after {
  animation-duration: 15s, 8704ms;
  animation-delay: 0ms, 539ms;
}

@keyframes move7 {
  0% {
    transform: translateX(-20vw) translateY(11vh) scale(0.47);
  }
  5.5555555556% {
    transform: translateX(12vw) translateY(6vh) scale(0.78);
  }
  11.1111111111% {
    transform: translateX(0vw) translateY(-3vh) scale(0.91);
  }
  16.6666666667% {
    transform: translateX(-21vw) translateY(-45vh) scale(0.49);
  }
  22.2222222222% {
    transform: translateX(-47vw) translateY(-47vh) scale(0.91);
  }
  27.7777777778% {
    transform: translateX(31vw) translateY(-41vh) scale(0.42);
  }
  33.3333333333% {
    transform: translateX(6vw) translateY(-6vh) scale(0.37);
  }
  38.8888888889% {
    transform: translateX(-6vw) translateY(-10vh) scale(0.38);
  }
  44.4444444444% {
    transform: translateX(-23vw) translateY(-13vh) scale(0.82);
  }
  50% {
    transform: translateX(-45vw) translateY(36vh) scale(0.36);
  }
  55.5555555556% {
    transform: translateX(-48vw) translateY(-33vh) scale(0.88);
  }
  61.1111111111% {
    transform: translateX(50vw) translateY(-21vh) scale(0.88);
  }
  66.6666666667% {
    transform: translateX(-36vw) translateY(-7vh) scale(0.58);
  }
  72.2222222222% {
    transform: translateX(-26vw) translateY(-24vh) scale(0.96);
  }
  77.7777777778% {
    transform: translateX(-33vw) translateY(47vh) scale(0.77);
  }
  83.3333333333% {
    transform: translateX(47vw) translateY(21vh) scale(1);
  }
  88.8888888889% {
    transform: translateX(-19vw) translateY(-12vh) scale(0.77);
  }
  94.4444444444% {
    transform: translateX(-22vw) translateY(3vh) scale(0.88);
  }
  100% {
    transform: translateX(17vw) translateY(-43vh) scale(0.77);
  }
}
.firefly:nth-child(8) {
  animation-name: move8;
}
.firefly:nth-child(8)::before {
  animation-duration: 12s;
}
.firefly:nth-child(8)::after {
  animation-duration: 12s, 9575ms;
  animation-delay: 0ms, 3759ms;
}

@keyframes move8 {
  0% {
    transform: translateX(2vw) translateY(-46vh) scale(0.45);
  }
  3.8461538462% {
    transform: translateX(8vw) translateY(31vh) scale(0.28);
  }
  7.6923076923% {
    transform: translateX(-44vw) translateY(-18vh) scale(0.4);
  }
  11.5384615385% {
    transform: translateX(47vw) translateY(-38vh) scale(0.92);
  }
  15.3846153846% {
    transform: translateX(-3vw) translateY(-19vh) scale(0.3);
  }
  19.2307692308% {
    transform: translateX(-36vw) translateY(32vh) scale(0.49);
  }
  23.0769230769% {
    transform: translateX(-27vw) translateY(9vh) scale(0.65);
  }
  26.9230769231% {
    transform: translateX(-18vw) translateY(17vh) scale(0.51);
  }
  30.7692307692% {
    transform: translateX(-41vw) translateY(-40vh) scale(0.44);
  }
  34.6153846154% {
    transform: translateX(50vw) translateY(9vh) scale(0.68);
  }
  38.4615384615% {
    transform: translateX(25vw) translateY(-44vh) scale(0.67);
  }
  42.3076923077% {
    transform: translateX(-40vw) translateY(16vh) scale(0.3);
  }
  46.1538461538% {
    transform: translateX(31vw) translateY(-40vh) scale(0.48);
  }
  50% {
    transform: translateX(-22vw) translateY(-25vh) scale(0.73);
  }
  53.8461538462% {
    transform: translateX(28vw) translateY(0vh) scale(0.53);
  }
  57.6923076923% {
    transform: translateX(-3vw) translateY(22vh) scale(0.38);
  }
  61.5384615385% {
    transform: translateX(16vw) translateY(37vh) scale(0.47);
  }
  65.3846153846% {
    transform: translateX(23vw) translateY(-45vh) scale(0.79);
  }
  69.2307692308% {
    transform: translateX(-9vw) translateY(-9vh) scale(0.99);
  }
  73.0769230769% {
    transform: translateX(-35vw) translateY(-26vh) scale(0.49);
  }
  76.9230769231% {
    transform: translateX(42vw) translateY(-25vh) scale(0.91);
  }
  80.7692307692% {
    transform: translateX(21vw) translateY(-39vh) scale(0.65);
  }
  84.6153846154% {
    transform: translateX(-27vw) translateY(-1vh) scale(0.44);
  }
  88.4615384615% {
    transform: translateX(31vw) translateY(29vh) scale(0.91);
  }
  92.3076923077% {
    transform: translateX(29vw) translateY(-43vh) scale(0.43);
  }
  96.1538461538% {
    transform: translateX(-13vw) translateY(-12vh) scale(0.27);
  }
  100% {
    transform: translateX(-1vw) translateY(45vh) scale(0.3);
  }
}
.firefly:nth-child(9) {
  animation-name: move9;
}
.firefly:nth-child(9)::before {
  animation-duration: 14s;
}
.firefly:nth-child(9)::after {
  animation-duration: 14s, 6652ms;
  animation-delay: 0ms, 8375ms;
}

@keyframes move9 {
  0% {
    transform: translateX(5vw) translateY(-49vh) scale(0.95);
  }
  5.8823529412% {
    transform: translateX(-5vw) translateY(23vh) scale(0.88);
  }
  11.7647058824% {
    transform: translateX(-32vw) translateY(-40vh) scale(0.75);
  }
  17.6470588235% {
    transform: translateX(44vw) translateY(20vh) scale(0.6);
  }
  23.5294117647% {
    transform: translateX(8vw) translateY(-18vh) scale(0.43);
  }
  29.4117647059% {
    transform: translateX(29vw) translateY(12vh) scale(0.35);
  }
  35.2941176471% {
    transform: translateX(13vw) translateY(40vh) scale(0.81);
  }
  41.1764705882% {
    transform: translateX(-28vw) translateY(-28vh) scale(0.73);
  }
  47.0588235294% {
    transform: translateX(27vw) translateY(-25vh) scale(0.29);
  }
  52.9411764706% {
    transform: translateX(-42vw) translateY(-35vh) scale(0.9);
  }
  58.8235294118% {
    transform: translateX(-20vw) translateY(-25vh) scale(0.31);
  }
  64.7058823529% {
    transform: translateX(25vw) translateY(8vh) scale(0.34);
  }
  70.5882352941% {
    transform: translateX(1vw) translateY(-17vh) scale(0.55);
  }
  76.4705882353% {
    transform: translateX(13vw) translateY(-13vh) scale(0.93);
  }
  82.3529411765% {
    transform: translateX(46vw) translateY(48vh) scale(0.54);
  }
  88.2352941176% {
    transform: translateX(18vw) translateY(43vh) scale(0.95);
  }
  94.1176470588% {
    transform: translateX(-1vw) translateY(-17vh) scale(0.83);
  }
  100% {
    transform: translateX(14vw) translateY(31vh) scale(0.65);
  }
}
.firefly:nth-child(10) {
  animation-name: move10;
}
.firefly:nth-child(10)::before {
  animation-duration: 11s;
}
.firefly:nth-child(10)::after {
  animation-duration: 11s, 6628ms;
  animation-delay: 0ms, 3186ms;
}

@keyframes move10 {
  0% {
    transform: translateX(-8vw) translateY(37vh) scale(0.5);
  }
  3.8461538462% {
    transform: translateX(42vw) translateY(-7vh) scale(0.96);
  }
  7.6923076923% {
    transform: translateX(8vw) translateY(40vh) scale(0.7);
  }
  11.5384615385% {
    transform: translateX(11vw) translateY(-33vh) scale(0.65);
  }
  15.3846153846% {
    transform: translateX(42vw) translateY(45vh) scale(0.54);
  }
  19.2307692308% {
    transform: translateX(35vw) translateY(-24vh) scale(0.27);
  }
  23.0769230769% {
    transform: translateX(-4vw) translateY(-22vh) scale(0.87);
  }
  26.9230769231% {
    transform: translateX(46vw) translateY(-15vh) scale(0.83);
  }
  30.7692307692% {
    transform: translateX(37vw) translateY(37vh) scale(0.33);
  }
  34.6153846154% {
    transform: translateX(45vw) translateY(37vh) scale(0.42);
  }
  38.4615384615% {
    transform: translateX(-31vw) translateY(-47vh) scale(0.74);
  }
  42.3076923077% {
    transform: translateX(-26vw) translateY(-24vh) scale(0.84);
  }
  46.1538461538% {
    transform: translateX(-38vw) translateY(-13vh) scale(0.82);
  }
  50% {
    transform: translateX(28vw) translateY(-37vh) scale(0.52);
  }
  53.8461538462% {
    transform: translateX(42vw) translateY(-1vh) scale(0.79);
  }
  57.6923076923% {
    transform: translateX(34vw) translateY(3vh) scale(0.49);
  }
  61.5384615385% {
    transform: translateX(-27vw) translateY(41vh) scale(0.81);
  }
  65.3846153846% {
    transform: translateX(36vw) translateY(-34vh) scale(0.63);
  }
  69.2307692308% {
    transform: translateX(-6vw) translateY(29vh) scale(0.58);
  }
  73.0769230769% {
    transform: translateX(41vw) translateY(15vh) scale(0.82);
  }
  76.9230769231% {
    transform: translateX(8vw) translateY(-21vh) scale(0.52);
  }
  80.7692307692% {
    transform: translateX(-33vw) translateY(-43vh) scale(0.47);
  }
  84.6153846154% {
    transform: translateX(-28vw) translateY(-18vh) scale(0.68);
  }
  88.4615384615% {
    transform: translateX(40vw) translateY(27vh) scale(0.53);
  }
  92.3076923077% {
    transform: translateX(-49vw) translateY(-26vh) scale(0.48);
  }
  96.1538461538% {
    transform: translateX(-47vw) translateY(14vh) scale(0.41);
  }
  100% {
    transform: translateX(39vw) translateY(30vh) scale(0.97);
  }
}
.firefly:nth-child(11) {
  animation-name: move11;
}
.firefly:nth-child(11)::before {
  animation-duration: 11s;
}
.firefly:nth-child(11)::after {
  animation-duration: 11s, 10175ms;
  animation-delay: 0ms, 2857ms;
}

@keyframes move11 {
  0% {
    transform: translateX(-7vw) translateY(-8vh) scale(0.34);
  }
  5.5555555556% {
    transform: translateX(28vw) translateY(-27vh) scale(0.84);
  }
  11.1111111111% {
    transform: translateX(-5vw) translateY(-26vh) scale(0.49);
  }
  16.6666666667% {
    transform: translateX(46vw) translateY(-2vh) scale(0.78);
  }
  22.2222222222% {
    transform: translateX(-39vw) translateY(-11vh) scale(0.45);
  }
  27.7777777778% {
    transform: translateX(-43vw) translateY(-46vh) scale(0.98);
  }
  33.3333333333% {
    transform: translateX(26vw) translateY(-39vh) scale(0.75);
  }
  38.8888888889% {
    transform: translateX(1vw) translateY(-34vh) scale(0.76);
  }
  44.4444444444% {
    transform: translateX(1vw) translateY(-28vh) scale(0.77);
  }
  50% {
    transform: translateX(-31vw) translateY(-32vh) scale(0.54);
  }
  55.5555555556% {
    transform: translateX(13vw) translateY(50vh) scale(0.65);
  }
  61.1111111111% {
    transform: translateX(-38vw) translateY(11vh) scale(0.58);
  }
  66.6666666667% {
    transform: translateX(-18vw) translateY(1vh) scale(0.57);
  }
  72.2222222222% {
    transform: translateX(-19vw) translateY(36vh) scale(0.41);
  }
  77.7777777778% {
    transform: translateX(-46vw) translateY(46vh) scale(0.73);
  }
  83.3333333333% {
    transform: translateX(16vw) translateY(25vh) scale(0.66);
  }
  88.8888888889% {
    transform: translateX(48vw) translateY(20vh) scale(0.62);
  }
  94.4444444444% {
    transform: translateX(-31vw) translateY(-26vh) scale(0.9);
  }
  100% {
    transform: translateX(28vw) translateY(45vh) scale(0.74);
  }
}
.firefly:nth-child(12) {
  animation-name: move12;
}
.firefly:nth-child(12)::before {
  animation-duration: 11s;
}
.firefly:nth-child(12)::after {
  animation-duration: 11s, 8912ms;
  animation-delay: 0ms, 4222ms;
}

@keyframes move12 {
  0% {
    transform: translateX(11vw) translateY(8vh) scale(0.61);
  }
  4.347826087% {
    transform: translateX(-13vw) translateY(-34vh) scale(0.6);
  }
  8.6956521739% {
    transform: translateX(-44vw) translateY(-48vh) scale(0.65);
  }
  13.0434782609% {
    transform: translateX(-28vw) translateY(36vh) scale(0.89);
  }
  17.3913043478% {
    transform: translateX(-22vw) translateY(44vh) scale(0.58);
  }
  21.7391304348% {
    transform: translateX(2vw) translateY(32vh) scale(0.88);
  }
  26.0869565217% {
    transform: translateX(38vw) translateY(38vh) scale(0.65);
  }
  30.4347826087% {
    transform: translateX(6vw) translateY(-26vh) scale(1);
  }
  34.7826086957% {
    transform: translateX(25vw) translateY(45vh) scale(0.66);
  }
  39.1304347826% {
    transform: translateX(-21vw) translateY(-38vh) scale(0.39);
  }
  43.4782608696% {
    transform: translateX(12vw) translateY(38vh) scale(0.3);
  }
  47.8260869565% {
    transform: translateX(29vw) translateY(-3vh) scale(0.71);
  }
  52.1739130435% {
    transform: translateX(13vw) translateY(-34vh) scale(0.34);
  }
  56.5217391304% {
    transform: translateX(-16vw) translateY(-34vh) scale(0.37);
  }
  60.8695652174% {
    transform: translateX(-10vw) translateY(-47vh) scale(0.32);
  }
  65.2173913043% {
    transform: translateX(32vw) translateY(0vh) scale(0.79);
  }
  69.5652173913% {
    transform: translateX(-8vw) translateY(-40vh) scale(0.28);
  }
  73.9130434783% {
    transform: translateX(-36vw) translateY(17vh) scale(0.51);
  }
  78.2608695652% {
    transform: translateX(-23vw) translateY(-24vh) scale(0.56);
  }
  82.6086956522% {
    transform: translateX(34vw) translateY(27vh) scale(0.99);
  }
  86.9565217391% {
    transform: translateX(-33vw) translateY(10vh) scale(0.46);
  }
  91.3043478261% {
    transform: translateX(-2vw) translateY(-45vh) scale(0.37);
  }
  95.652173913% {
    transform: translateX(-46vw) translateY(-21vh) scale(0.42);
  }
  100% {
    transform: translateX(-7vw) translateY(-8vh) scale(0.79);
  }
}
.firefly:nth-child(13) {
  animation-name: move13;
}
.firefly:nth-child(13)::before {
  animation-duration: 13s;
}
.firefly:nth-child(13)::after {
  animation-duration: 13s, 7433ms;
  animation-delay: 0ms, 3757ms;
}

@keyframes move13 {
  0% {
    transform: translateX(-20vw) translateY(5vh) scale(0.45);
  }
  3.8461538462% {
    transform: translateX(7vw) translateY(44vh) scale(0.62);
  }
  7.6923076923% {
    transform: translateX(-27vw) translateY(48vh) scale(0.95);
  }
  11.5384615385% {
    transform: translateX(36vw) translateY(-48vh) scale(0.99);
  }
  15.3846153846% {
    transform: translateX(15vw) translateY(-44vh) scale(0.75);
  }
  19.2307692308% {
    transform: translateX(18vw) translateY(20vh) scale(0.94);
  }
  23.0769230769% {
    transform: translateX(16vw) translateY(43vh) scale(0.63);
  }
  26.9230769231% {
    transform: translateX(-33vw) translateY(-30vh) scale(0.32);
  }
  30.7692307692% {
    transform: translateX(5vw) translateY(23vh) scale(0.61);
  }
  34.6153846154% {
    transform: translateX(-38vw) translateY(28vh) scale(0.87);
  }
  38.4615384615% {
    transform: translateX(32vw) translateY(-23vh) scale(0.34);
  }
  42.3076923077% {
    transform: translateX(-41vw) translateY(-25vh) scale(0.91);
  }
  46.1538461538% {
    transform: translateX(-20vw) translateY(42vh) scale(0.41);
  }
  50% {
    transform: translateX(-37vw) translateY(-7vh) scale(0.91);
  }
  53.8461538462% {
    transform: translateX(-11vw) translateY(20vh) scale(0.39);
  }
  57.6923076923% {
    transform: translateX(-5vw) translateY(17vh) scale(0.74);
  }
  61.5384615385% {
    transform: translateX(-49vw) translateY(5vh) scale(0.81);
  }
  65.3846153846% {
    transform: translateX(-12vw) translateY(-48vh) scale(0.73);
  }
  69.2307692308% {
    transform: translateX(31vw) translateY(34vh) scale(0.34);
  }
  73.0769230769% {
    transform: translateX(-49vw) translateY(-48vh) scale(0.31);
  }
  76.9230769231% {
    transform: translateX(-11vw) translateY(10vh) scale(0.67);
  }
  80.7692307692% {
    transform: translateX(-24vw) translateY(30vh) scale(0.31);
  }
  84.6153846154% {
    transform: translateX(-36vw) translateY(-30vh) scale(0.63);
  }
  88.4615384615% {
    transform: translateX(8vw) translateY(16vh) scale(0.47);
  }
  92.3076923077% {
    transform: translateX(-36vw) translateY(-18vh) scale(0.4);
  }
  96.1538461538% {
    transform: translateX(22vw) translateY(-34vh) scale(0.7);
  }
  100% {
    transform: translateX(-9vw) translateY(2vh) scale(0.92);
  }
}
.firefly:nth-child(14) {
  animation-name: move14;
}
.firefly:nth-child(14)::before {
  animation-duration: 18s;
}
.firefly:nth-child(14)::after {
  animation-duration: 18s, 7067ms;
  animation-delay: 0ms, 1649ms;
}

@keyframes move14 {
  0% {
    transform: translateX(28vw) translateY(10vh) scale(0.36);
  }
  5.5555555556% {
    transform: translateX(-18vw) translateY(26vh) scale(0.59);
  }
  11.1111111111% {
    transform: translateX(30vw) translateY(-23vh) scale(0.31);
  }
  16.6666666667% {
    transform: translateX(-12vw) translateY(-11vh) scale(0.52);
  }
  22.2222222222% {
    transform: translateX(16vw) translateY(-29vh) scale(0.71);
  }
  27.7777777778% {
    transform: translateX(2vw) translateY(-23vh) scale(0.7);
  }
  33.3333333333% {
    transform: translateX(-42vw) translateY(-23vh) scale(0.96);
  }
  38.8888888889% {
    transform: translateX(-5vw) translateY(-19vh) scale(0.7);
  }
  44.4444444444% {
    transform: translateX(-38vw) translateY(14vh) scale(0.39);
  }
  50% {
    transform: translateX(-30vw) translateY(4vh) scale(0.27);
  }
  55.5555555556% {
    transform: translateX(18vw) translateY(-36vh) scale(0.5);
  }
  61.1111111111% {
    transform: translateX(-3vw) translateY(0vh) scale(0.37);
  }
  66.6666666667% {
    transform: translateX(-7vw) translateY(-20vh) scale(0.95);
  }
  72.2222222222% {
    transform: translateX(-34vw) translateY(-8vh) scale(0.73);
  }
  77.7777777778% {
    transform: translateX(20vw) translateY(-39vh) scale(0.61);
  }
  83.3333333333% {
    transform: translateX(5vw) translateY(15vh) scale(0.67);
  }
  88.8888888889% {
    transform: translateX(18vw) translateY(38vh) scale(0.78);
  }
  94.4444444444% {
    transform: translateX(22vw) translateY(-38vh) scale(0.31);
  }
  100% {
    transform: translateX(0vw) translateY(-26vh) scale(0.29);
  }
}
.firefly:nth-child(15) {
  animation-name: move15;
}
.firefly:nth-child(15)::before {
  animation-duration: 17s;
}
.firefly:nth-child(15)::after {
  animation-duration: 17s, 9268ms;
  animation-delay: 0ms, 2464ms;
}

@keyframes move15 {
  0% {
    transform: translateX(34vw) translateY(35vh) scale(0.53);
  }
  3.5714285714% {
    transform: translateX(48vw) translateY(-33vh) scale(0.78);
  }
  7.1428571429% {
    transform: translateX(6vw) translateY(-13vh) scale(0.72);
  }
  10.7142857143% {
    transform: translateX(35vw) translateY(-23vh) scale(0.65);
  }
  14.2857142857% {
    transform: translateX(41vw) translateY(-10vh) scale(0.41);
  }
  17.8571428571% {
    transform: translateX(49vw) translateY(-2vh) scale(0.61);
  }
  21.4285714286% {
    transform: translateX(-14vw) translateY(-11vh) scale(0.7);
  }
  25% {
    transform: translateX(26vw) translateY(-28vh) scale(0.81);
  }
  28.5714285714% {
    transform: translateX(17vw) translateY(-25vh) scale(0.44);
  }
  32.1428571429% {
    transform: translateX(21vw) translateY(40vh) scale(0.38);
  }
  35.7142857143% {
    transform: translateX(-40vw) translateY(7vh) scale(0.71);
  }
  39.2857142857% {
    transform: translateX(50vw) translateY(1vh) scale(0.33);
  }
  42.8571428571% {
    transform: translateX(0vw) translateY(44vh) scale(0.62);
  }
  46.4285714286% {
    transform: translateX(-39vw) translateY(44vh) scale(0.37);
  }
  50% {
    transform: translateX(-12vw) translateY(-36vh) scale(0.85);
  }
  53.5714285714% {
    transform: translateX(-16vw) translateY(-30vh) scale(0.41);
  }
  57.1428571429% {
    transform: translateX(25vw) translateY(46vh) scale(0.96);
  }
  60.7142857143% {
    transform: translateX(28vw) translateY(-28vh) scale(0.73);
  }
  64.2857142857% {
    transform: translateX(-34vw) translateY(22vh) scale(0.49);
  }
  67.8571428571% {
    transform: translateX(-49vw) translateY(1vh) scale(0.44);
  }
  71.4285714286% {
    transform: translateX(-30vw) translateY(-25vh) scale(0.77);
  }
  75% {
    transform: translateX(-3vw) translateY(-31vh) scale(0.59);
  }
  78.5714285714% {
    transform: translateX(28vw) translateY(-3vh) scale(0.64);
  }
  82.1428571429% {
    transform: translateX(-5vw) translateY(-40vh) scale(0.85);
  }
  85.7142857143% {
    transform: translateX(9vw) translateY(-1vh) scale(0.38);
  }
  89.2857142857% {
    transform: translateX(23vw) translateY(-13vh) scale(0.45);
  }
  92.8571428571% {
    transform: translateX(-41vw) translateY(38vh) scale(0.9);
  }
  96.4285714286% {
    transform: translateX(5vw) translateY(41vh) scale(0.56);
  }
  100% {
    transform: translateX(20vw) translateY(6vh) scale(0.55);
  }
}
@keyframes drift {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
@keyframes flash {
  0%, 30%, 100% {
    opacity: 0;
    box-shadow: 0 0 0vw 0vw yellow;
  }
  5% {
    opacity: 1;
    box-shadow: 0 0 2vw 0.4vw yellow;
  }
}


/*##############################################################*/

    
    /*inicio estilos Cartas */
    .popup{
    margin: 0 auto;
    }
	 .popup-content {
	    display: flex;
	    width: 50vw;
	    height: 50vh;
	    align-items: center;
	    padding-left: 200px;
	}
 /*carta 1*/
.card1 {
    border: 1px solid black;
    padding: 10px;
    margin: 5px;
    width: 200px;
    height: 250px;
    background-color: rgba(40, 147, 128, 0.5); /* Fondo con transparencia */
    border-top-left-radius: 30px;
    border-bottom-right-radius: 30px;
    display: flex;
    flex-direction: column;
    transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease; /* Añadido border-color para la transición */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(8px); /* Desenfoque del fondo */
}

.card1:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    border-color: #4dfcff; /* Color del borde neon al hacer hover */
    outline: 2px solid #4dfcff; /* Contorno exterior con color neon */
}


/*carta 2*/
    
.card2 {
    border: 1px solid black;
    padding: 10px;
    margin: 5px;
    width: 200px;
    height: 250px;
    background-color: rgba(187, 78, 205, 0.5); /* Fondo con transparencia */
    border-radius: 30px;
    display: flex;
    flex-direction: column;
    transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease; /* Transiciones para el efecto hover */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(8px); /* Desenfoque del fondo */
}

.card2:hover {
    transform: scale(1.05); /* Efecto de zoom al hacer hover */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Sombra más pronunciada */
    border-color: #ff4dff; /* Color del borde neon al hacer hover */
    outline: 2px solid #ff4dff; /* Contorno exterior con color neon */
}

/*carta 3 */
    
.card3 {
    border: 1px solid black;
    padding: 10px;
    margin: 5px;
    width: 200px;
    height: 250px;
    background-color: rgba(199, 164, 26, 0.5); /* Fondo con transparencia */
    border-top-left-radius: 30px;
    border-bottom-right-radius: 30px;
    display: flex;
    flex-direction: column;
    transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease; /* Transiciones para el efecto hover */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(8px); /* Desenfoque del fondo */
}

.card3:hover {
    transform: scale(1.05); /* Efecto de zoom al hacer hover */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Sombra más pronunciada */
    border-color: #ffbf00; /* Color del borde neon al hacer hover */
    outline: 2px solid #ffbf00; /* Contorno exterior con color neon */
}

    
    .popup-content h2 {
    text-align: center;
    font-family: 'Lobster', cursive; /* Aplica la fuente Lobster */
    }
    
    .card1 ul{
    margin-bottom: 70px; 
    margin-top: 20px
     
    }
    .card2 ul{
    margin-bottom: 70px; 
    margin-top: 20px
    }
    .card3 ul{
    margin-bottom: 70px; 
    margin-top: 20px
    }
    
    
	.card1 button {
    border-radius: 30px;
    background-color: green;
    transition: background-color 0.3s; /* Agregamos transición para un cambio suave */
    height: 30px;
    color: white;
	}
	
	.card2 button {
    border-radius: 30px;
    background-color: green;
    transition: background-color 0.3s; /* Agregamos transición para un cambio suave */
    height: 30px;
    color: white;
	}
	
	.card3 button {
    border-radius: 30px;
    background-color: green;
    transition: background-color 0.3s; /* Agregamos transición para un cambio suave */
    height: 30px;
    color: white;
	}
	
	.btnTar:hover {
	    background-color: red; /* Cambia el color de fondo a rojo al pasar el cursor sobre el botón */
	}

    
    /* fin estilos Cartas */
	
    #form-popup {
        display: none;
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 9999;
        justify-content: center;
        align-items: center;
    }

/*facturas cuerpo*/
#form-content {
    width: 250px;
    background-color: rgba(255, 255, 255, 0.5); /* Fondo blanco con transparencia del 90% */
    padding: 20px;
    border-radius: 5px;
    display: flex;
    flex-direction: column;
    align-items: center;
    backdrop-filter: blur(8px); /* Desenfoque del fondo */
}



	.conten-form h2 {
        font-family: 'Lobster', cursive; 
    }
    
    form {
    display:flex;
    flex-direction: column;
    
    }
    
.btn1, .btn2 {
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
  border: none;
  border-radius: 30px;
  color: white;
  transition: background-color 0.3s, color 0.3s;
}

.btn1 {
  background-color: green;
  margin-bottom: 10px;
}

.btn2 {
  background-color: red;
  margin-bottom: 20px;
}

.btn1:hover {
  background-color: darkgreen;
}

.btn2:hover {
  background-color: darkred;
}
    
    .btn3 {
	display: flex;
    border: none;
    background: none;
    align-items: center;
    justify-content: space-between;
    }
    
    .imgImage{
     width: 20px;
    }
    
    input{
    padding-left: 10px;
    border-top-left-radius: 15px;
    border-bottom-right-radius: 15px;
    }


        
        
        
        
</style>
</head>
<body>
    <!-- objetos que se mueven -->
<div class="firefly"></div>
<div class="firefly"></div>
<div class="firefly"></div>
<div class="firefly"></div>
<div class="firefly"></div>
<div class="firefly"></div>
<div class="firefly"></div>
<div class="firefly"></div>
<div class="firefly"></div>
<div class="firefly"></div>
<div class="firefly"></div>
<div class="firefly"></div>
<div class="firefly"></div>
<div class="firefly"></div>
<div class="firefly"></div>
<!<!-- fin objetos que se mueven -->

<div class="popup" id="popup">
  <div class="popup-content">
    <div class="card1" id="free">
        <h2>Free</h2>
        <ul>
            <li>limitado</li>
            <li>anuncios</li>
            <li>$/0.00</li>
        </ul>
        <button class="btnTar" onclick="openForm('Free', '0', '1')">Comprar</button>
    </div>
    <div class="card2" id="monthly">
        <h2>Premium Mensual</h2>
        <ul>
            <li>Ilimitado</li>
            <li>Sin anuncios</li>
            <li>$/10.00</li>
        </ul>
        <button class="btnTar" onclick="openForm('Premium Mensual', '10', '2')">Comprar</button>
    </div>
    <div class="card3" id="annual">
        <h2>Premium Anual</h2>
        <ul>
            <li>Ilimitado</li>
            <li>Sin anuncios</li>
            <li>$/75.00</li>
        </ul>
        <button class="btnTar" onclick="openForm('Premium Anual', '75', '3')">Comprar</button>
    </div>
  </div>
</div>

<div id="form-popup" class="conten-form">
    <div id="form-content">
        <h2 id="form-title"></h2>
        <!-- Aquí puedes agregar los campos del formulario -->
        <form id="myForm" method="post" action="ServletUsuario?accion=factura">
            <div id="boleta-campos" class="form">
                <!-- Campos específicos para boleta -->
                <label>Fecha: </label>
                <input type="date" id="fecha" name="fechaPag" placeholder="fecha" style="pointer-events: none; background-color: #f0f0f0;" ><br><br>
                <label>Precio: </label>
                <input type="text" id="monto" name="montoPag" placeholder="monto" style="pointer-events: none; background-color: #f0f0f0;" ><br><br>
                <input type="text" id="tipoId" name="tipCuentaPag" placeholder="TipoCuenta" style="display: none;"><br><br>
            </div>
            <div id="factura-campos" class="form">
                <!-- Campos específicos para factura -->
                <input type="text" id="rasonEmpresa" name="razonEmpresaPag" placeholder="Razonsocial Empresa"><br><br>
                <input type="text" id="rasonCliente" name="razonClientePag" placeholder="Razonsocial Cliente"><br><br>
                <input type="text" id="direcion" name="direccionPag" placeholder="dirección"><br><br>
                <input type="text" id="igv" name="igvPag" placeholder="IGV" value="18" readonly style="pointer-events: none; background-color: #f0f0f0; display: none;"><br><br>
                
            </div>
            <button class="btn1" type="submit">Enviar</button>
            <button class="btn2" type="button" onclick="closeForm()">Cerrar</button>
		    <button class="btn3" type="button" onclick="toggleTipo()">
		      <h6>Boleta</h6>
			  <img class="imgImage" src="imagenes/sincronizar.png" alt="Descripción de la imagen">
			  <h6>Factura</h6>
			</button>
        </form>
    </div>
</div>

<script>
    function openForm(cardType, monto, tipoId) {
        document.getElementById("popup").style.display = "none";
        document.getElementById("form-popup").style.display = "flex";
        document.getElementById("form-title").innerText = cardType;
        document.getElementById("monto").value = monto; // Establecer el valor del campo monto en el formulario
        document.getElementById("tipoId").value = tipoId;
    }

    function closeForm() {
        document.getElementById("popup").style.display = "flex";
        document.getElementById("form-popup").style.display = "none";
    }
    
    /*alternancia de boleta o factura*/
    function toggleTipo() {
        var facturaCampos = document.getElementById("factura-campos");
        var formulario = document.getElementById("myForm");

        if (facturaCampos.style.display === "none") {
            facturaCampos.style.display = "block";
            formulario.action = "ServletUsuario?accion=factura";
        } else {
            facturaCampos.style.display = "none";
            formulario.action = "ServletUsuario?accion=boleta";
        }
    }
</script>

<script type="text/javascript">
        function setCurrentDate() {
            // Obtener la fecha actual
            var today = new Date();
            
            // Formatear la fecha a YYYY-MM-DD
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); // Enero es 0
            var yyyy = today.getFullYear();
            
            var formattedDate = yyyy + '-' + mm + '-' + dd;
            
            // Establecer la fecha en el campo de entrada
            document.getElementById('fecha').value = formattedDate;
        }

        // Llamar a la función setCurrentDate cuando la página se carga
        window.onload = setCurrentDate;
</script>



</body>
</html>