const baseURL = window.location.host;
const appId = window.location.pathname;
const ws = new WebSocket('wss://'+ baseURL+ '/ws/' + appId);

ws.onopen = () => {
    console.log('Now connected');
    fetch(window.location.href + '/clear', { method: 'post'})
};

ws.onmessage = (event) => {
    var node = document.createElement('DIV');
    node.className = 'block';
    var codeBlock = document.createElement('CODE');
    codeBlock.className = 'lang-js';
    codeBlock.innerHTML = event.data;
    node.appendChild(codeBlock);
    document.body.appendChild(node);
};
