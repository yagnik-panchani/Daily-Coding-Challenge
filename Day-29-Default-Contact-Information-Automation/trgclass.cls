public class trgclass
{
    public static void trgmethod(List<Contact> conList)
    {
        List<Contact> con = new List<Contact>();
        if(!conList.isEmpty())

{
    for(Contact c : conList)
    {
        if(c.Email == null)
        {
            c.Email = 'notprovided@company.com';
            con.add(c);
        }
    }
}  

        if(!con.isEmpty())
        {
            insert con;
        }
    }
}
