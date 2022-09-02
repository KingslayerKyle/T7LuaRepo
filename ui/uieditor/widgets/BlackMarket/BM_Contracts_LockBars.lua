-- a1d9badba01232dce51390f635fbe544
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Contracts_LockBars = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_LockBars.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_LockBars )
	self.id = "BM_Contracts_LockBars"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 57 )
	self:setTopBottom( true, false, 0, 41 )
	
	local bmContractBars = LUI.UIImage.new()
	bmContractBars:setLeftRight( true, false, 0.5, 24.5 )
	bmContractBars:setTopBottom( true, false, 0.5, 40.5 )
	bmContractBars:setImage( RegisterImage( "uie_t7_bm_special_contracts_lineleft" ) )
	self:addElement( bmContractBars )
	self.bmContractBars = bmContractBars
	
	local bmContractBars0 = LUI.UIImage.new()
	bmContractBars0:setLeftRight( true, true, 24.5, -24.5 )
	bmContractBars0:setTopBottom( true, false, 0.5, 40.5 )
	bmContractBars0:setImage( RegisterImage( "uie_t7_bm_special_contracts_linecenter" ) )
	self:addElement( bmContractBars0 )
	self.bmContractBars0 = bmContractBars0
	
	local bmContractBars00 = LUI.UIImage.new()
	bmContractBars00:setLeftRight( false, true, -24.5, -0.5 )
	bmContractBars00:setTopBottom( true, false, 0.5, 40.5 )
	bmContractBars00:setImage( RegisterImage( "uie_t7_bm_special_contracts_lineright" ) )
	self:addElement( bmContractBars00 )
	self.bmContractBars00 = bmContractBars00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

