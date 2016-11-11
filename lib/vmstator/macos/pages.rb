module Vmstator

  class MacOSPages < Stats
    attr_reader :free                   # total number of free pages in the system
    attr_reader :active                 # total number of pages currently in use and pageable
    attr_reader :inactive               # total number of pages on the inactive list
    attr_reader :speculative            # total number of pages on the speculative list
    attr_reader :throttled              # total number of pages on the throttled list (not wired but not pageable)
    attr_reader :wired_down             # total number of pages wired down. that is, pages that cannot be paged out
    attr_reader :purgeable              # total number of purgeable pages
    attr_reader :translation_faults     # number of times the "vm_fault" routine has been called
    attr_reader :copy_on_write          # number of faults that caused a page to be copied (generally caused by copy-on-write faults)
    attr_reader :zero_filled            # total number of pages that have been zero-filled on demand
    attr_reader :reactivated            # total number of pages that have been moved from the inactive list to the active list (reactivated)
    attr_reader :purged                 # total number of pages that have been purged 
    attr_reader :file_backed            # total number of pages that are file-backed (non-swap)
    attr_reader :anonymous              # total number of pages that are anonymous
    attr_reader :stored_in_compressor   # total number of pages (uncompressed) held within the compressor
    attr_reader :occupied_by_compressor # number of pages used to store compressed VM pages 
    attr_reader :decompressions         # total number of pages that have been decompressed by the VM compressor
    attr_reader :compressions           # total number of pages that have been compressed by the VM compressor
    attr_reader :ins                    # total number of requests for pages from a pager (such as the inode pager)
    attr_reader :outs                   # total number of pages that have been paged out
    attr_reader :swapins                # total number of compressed pages that have been swapped out to disk
    attr_reader :swapouts               # total number of compressed pages that have been swapped back in from disk

    def update(data)
      if data
        @free                   =  data[:pages_free]                   
        @active                 =  data[:pages_active]                
        @inactive               =  data[:pages_inactive]              
        @speculative            =  data[:pages_speculative]           
        @throttled              =  data[:pages_throttled]          
        @wired_down             =  data[:pages_wired_down]            
        @purgeable              =  data[:pages_purgeable]           
        @translation_faults     =  data[:translation_faults]          
        @copy_on_write          =  data[:pages_copy_on_write]         
        @zero_filled            =  data[:pages_zero_filled]        
        @reactivated            =  data[:pages_reactivated]          
        @purged                 =  data[:pages_purged]          
        @file_backed            =  data[:file_backed_pages]           
        @anonymous              =  data[:anonymous_pages]          
        @stored_in_compressor   =  data[:pages_stored_in_compressor] 
        @occupied_by_compressor =  data[:pages_occupied_by_compressor]
        @decompressions         =  data[:decompressions]
        @compressions           =  data[:compressions]             
        @ins                    =  data[:pageins]               
        @outs                   =  data[:pageouts]                    
        @swapins                =  data[:swapins]                   
        @swapouts               =  data[:swapouts]                    
      else
        return false
      end
      true
    end

  end
end
