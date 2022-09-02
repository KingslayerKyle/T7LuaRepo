-- 09ff8ef7795ddba577859868bfe3c6ab
-- This hash is used for caching, delete to decompile the file again

CoD.FR_RetriesNumbersBox = InheritFrom( LUI.UIElement )
CoD.FR_RetriesNumbersBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FR_RetriesNumbersBox )
	self.id = "FR_RetriesNumbersBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 50 )
	self:setTopBottom( true, false, 0, 37 )
	
	local Box4 = LUI.UIImage.new()
	Box4:setLeftRight( true, true, 0, 0.49 )
	Box4:setTopBottom( true, true, 0, -0.3 )
	Box4:setRGB( 0, 0, 0 )
	Box4:setAlpha( 0.2 )
	Box4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	Box4:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( Box4 )
	self.Box4 = Box4
	
	local RetriesNumber = LUI.UIText.new()
	RetriesNumber:setLeftRight( true, true, 12.49, -12.01 )
	RetriesNumber:setTopBottom( true, true, 4.85, -7.15 )
	RetriesNumber:setText( Engine.Localize( "4" ) )
	RetriesNumber:setTTF( "fonts/escom.ttf" )
	RetriesNumber:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RetriesNumber:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RetriesNumber )
	self.RetriesNumber = RetriesNumber
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			FaultAnim = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

