package es.uca.iw.myjob.domain;
import org.gvnix.addon.jpa.annotations.batch.GvNIXJpaBatch;
import org.springframework.stereotype.Service;

@Service
@GvNIXJpaBatch(entity = OfertaTrabajo.class)
public class OfertaTrabajoBatchService {
}
