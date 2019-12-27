import { Router } from 'express'
import apiValidate from '../utils/ApiValidate'
import endpointValidate from '../utils/EndPointValidation'
import verbValidate from '../utils/VerbValidate'
import codesrespValidate from '../utils/CodesRespValidation'
import CheckJwt from '../middlewares/CheckJwt'

import cApi from '../controllers/Api'
import cEndPoint from '../controllers/EndPoint'
import cVerbs from '../controllers/Verb'
import cCodeResp from '../controllers/CodesResp'
const routes = Router()

routes.use(CheckJwt.checkJwt)

routes.post('/api/api/create', apiValidate.create, cApi.store)
routes.get('/api/api/get/:apiId', cApi.indexOne)
routes.get('/api/api/getall', cApi.index)
routes.delete('/api/api/delete/:id', cApi.destroy)
routes.put('/api/api/update/:id', cApi.update)

routes.post('/api/endpoint/create/:apiId', endpointValidate.create, cEndPoint.store)
routes.get('/api/endpoint/getall/:apiId', cEndPoint.index)
routes.delete('/api/endpoint/delete/:id', cEndPoint.destroy)
routes.put('/api/endpoint/update/:id', cEndPoint.update)

routes.post('/api/verb/create/:endPointId', verbValidate.create, cVerbs.store)
routes.get('/api/verb/getall/:endPointId', cVerbs.index)

routes.post('/api/codesresp/create/:verbId', codesrespValidate.create, cCodeResp.store)

export default routes