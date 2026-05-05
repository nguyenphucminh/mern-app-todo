import axios from "axios"
const instance = axios.create({
    baseURL: import.meta.env.BE_API_URL
})
export default instance