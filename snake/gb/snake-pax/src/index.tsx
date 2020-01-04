import React, { useCallback } from 'react';
import ReactDOM from 'react-dom';
import './index.css';
// import App from './App';
import * as serviceWorker from './serviceWorker';
import { WasmBoy } from 'wasmboy'

const App = () => {

    const ref = useCallback(node => {
        if (node == null) {
            return;
        }

        (async () => {
            const WasmBoyOptions = {
                headless: false,
                useGbcWhenOptional: true,
                isAudioEnabled: true,
                frameSkip: 1,
                audioBatchProcessing: true,
                timersBatchProcessing: false,
                audioAccumulateSamples: true,
                graphicsBatchProcessing: false,
                graphicsDisableScanlineRendering: false,
                tileRendering: true,
                tileCaching: true,
                gameboyFPSCap: 60,
                updateGraphicsCallback: false,
                updateAudioCallback: false,
                saveStateCallback: false
            };

            await WasmBoy.config(WasmBoyOptions, node);

            console.log('WasmBoy is configured!');
            // You may now load games, or use other exported functions of the lib.
            await WasmBoy.loadROM('http://localhost:3000/gb.gb');

            await WasmBoy.play();
        });
    }, []);

    return (
        <div>
            <h1>Cool</h1>
            <canvas ref={ref} style={{width: 400, height: 400,}} />;
        </div>
    );
};

ReactDOM.render(<App />, document.getElementById('root'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
