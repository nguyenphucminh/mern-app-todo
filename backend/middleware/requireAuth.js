import jwt from 'jsonwebtoken';
const requireAuth = async (req, res, next) => {
    const { authorization } = req.headers;
    if (!authorization) {
        return res.status(401).json({message:'Unauthorized'});
    }
    const token = authorization.split(' ')[1]+"";
    try {
        const tokensecret = process.env.JWT_SECRET || "secret"
        const decoded =  jwt.verify(token, tokensecret);
        req.user = decoded;
        req.token = token;
        next();
    } catch (error) {
        return res.status(500).json({message:error.message});
    }
}
export default requireAuth;
