package information.service;

import java.util.List;

import information.dao.InformationDAO;
import information.dto.InformationDTO;

public class InformationServiceImp implements InformationService{
   private InformationDAO informationDao;
   
   public void setInformationDao(InformationDAO informationDao) {
	this.informationDao = informationDao;
}
   
   public InformationServiceImp() {
	
}

@Override
public List<InformationDTO> chooseinfo_process(String info_title) {
	return informationDao.chooseinfo(info_title);
}




}
