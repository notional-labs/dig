import logo from './logo.svg';
import './App.css';
import MainPage from './pages/MainPage';
import "@fontsource/montserrat";
import Coin from "./components/Coin"
import Effect from "./components/Effect"

const style = {
  app: {
    fontFamily: 'Montserrat',
    overflow: 'hidden',
    position: 'relative',
    paddingBottom: '400px' 
  }
}

function App() {
  return (
    <div className="App" style={style.app}>
      <div className="effect">
                <Coin width={120} x={-25} y={3.5} opacity={0.3} />
                <Coin width={200} x={30} y={2.5} opacity={0.5} />
                <Coin width={400} x={-30} y={7.5} opacity={0.5} />
                <Coin width={120} x={32} y={9} opacity={0.5} />
                <Coin width={300} x={50} y={25} opacity={0.5} />
                <Coin width={500} x={-45} y={48} opacity={0.5} />
                <Coin width={200} x={50} y={81} opacity={0.5} />
                <Coin width={1000} x={-35} y={93} opacity={0.5} />
            </div>
            <div className="effect-mobile">
                <Coin width={120} x={37} y={1.5} opacity={0.5} />
                <Coin width={80} x={-40} y={4.5} opacity={0.3} />
                <Coin width={200} x={-37} y={22.5} opacity={0.2} />
                <Coin width={500} x={-32} y={96} opacity={0.5} />
            </div>
            <div className="effect">
                <Effect x={15} y={-6} radius={1000} opacity={0.4} />
                <Effect x={60} y={4.5} radius={1500} opacity={0.4} />
                <Effect x={-30} y={18} radius={1000} opacity={0.4} />
                <Effect x={10} y={26} radius={500} opacity={0.4} />
                <Effect x={70} y={27} radius={600} opacity={0.4} />
                <Effect x={70} y={40} radius={900} opacity={0.4} />
                <Effect x={60} y={62} radius={400} opacity={0.4} />
                <Effect x={40} y={63} radius={600} opacity={0.4} />
                <Effect x={-20} y={75} radius={800} opacity={0.2} />
                <Effect x={70} y={85} radius={1200} opacity={0.4} />
            </div>
            <div className="effect-mobile">
                <Effect x={-70} y={-9} radius={1000} opacity={0.6} />
                <Effect x={-10} y={9} radius={200} opacity={0.5} />
                <Effect x={60} y={18} radius={300} opacity={0.5} />
                <Effect x={10} y={26} radius={500} opacity={0.5} />
                <Effect x={-10} y={50} radius={200} opacity={0.5} />
                <Effect x={70} y={40} radius={900} opacity={0.5} />
                <Effect x={60} y={61} radius={200} opacity={0.5} />
                <Effect x={-10} y={74} radius={200} opacity={0.5} />
                <Effect x={20} y={85} radius={1000} opacity={0.8} />
            </div>
      <MainPage/>
    </div>
  );
}

export default App;
