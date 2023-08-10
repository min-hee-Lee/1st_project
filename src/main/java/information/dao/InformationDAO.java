package information.dao;

import java.util.List;
import java.util.Map;

import information.dto.InformationDTO;

public interface InformationDAO {

	public List<InformationDTO> chooseinfo(String info_title);
	
}
