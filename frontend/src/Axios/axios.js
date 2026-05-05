import axios from "axios"
const instance = axios.create({
    baseURL: process.env.REACT_APP_BE_API_URL
})
export default instance