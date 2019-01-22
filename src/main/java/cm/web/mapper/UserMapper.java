package cm.web.mapper;

import cm.domain.User;
import cm.web.dto.UserDto;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface UserMapper {

    User map(UserDto userDto);

    UserDto map(User user);

}
