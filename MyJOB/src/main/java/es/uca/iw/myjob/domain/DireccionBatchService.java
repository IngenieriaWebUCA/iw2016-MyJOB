package es.uca.iw.myjob.domain;
import org.gvnix.addon.jpa.annotations.batch.GvNIXJpaBatch;
import org.springframework.stereotype.Service;

@Service
@GvNIXJpaBatch(entity = Direccion.class)
public class DireccionBatchService {
}
