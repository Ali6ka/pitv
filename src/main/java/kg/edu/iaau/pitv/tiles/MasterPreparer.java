package kg.edu.iaau.pitv.tiles;

import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.PreparerException;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MasterPreparer implements ViewPreparer {

    private static final Logger logger = LoggerFactory.getLogger(MasterPreparer.class);

    public MasterPreparer() {
    }

    @Override
    public void execute(Request request, AttributeContext attrContext) throws PreparerException {
    }
}
