module.exports = {
    /**
     * updatePlayerCount
     * Constantly updates the player count of the server at a steady rate
     * {object} client The client of the bot object
     * {number} seconds The integer amount for the derivate of # of times it refreshes the bot's activity
     * ```js
     * const {updatePlayerCount} = require("./utils/")
     * const { Client } = require('discord.js');
     * const client = new Client;
     * updatePlayerCount(client, 10)
     * // this will update the bot's activity every 10 seconds
     * ````
     */
    updatePlayerCount: (client, seconds) => {
        const interval = setInterval(function setStatus() {
            let status = `${GetNumPlayerIndices()} player(s)`;
            //console.log(status)
            client.user.setActivity(status, {type: 'WATCHING'})
            return setStatus;
        }(), seconds * 1000)
    }

}