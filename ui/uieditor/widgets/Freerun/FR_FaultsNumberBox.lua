-- 1624480d801f097c8329e0baec0ae921
-- This hash is used for caching, delete to decompile the file again

CoD.FR_FaultsNumberBox = InheritFrom( LUI.UIElement )
CoD.FR_FaultsNumberBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FR_FaultsNumberBox )
	self.id = "FR_FaultsNumberBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 50 )
	self:setTopBottom( true, false, 0, 37 )
	
	local Box3 = LUI.UIImage.new()
	Box3:setLeftRight( true, true, 0, 0.49 )
	Box3:setTopBottom( true, true, 0, -0.3 )
	Box3:setRGB( 0, 0, 0 )
	Box3:setAlpha( 0.2 )
	Box3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	Box3:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( Box3 )
	self.Box3 = Box3
	
	local FaultsNumber = LUI.UIText.new()
	FaultsNumber:setLeftRight( true, true, 10.99, -12.51 )
	FaultsNumber:setTopBottom( true, true, 5.85, -6.15 )
	FaultsNumber:setText( Engine.Localize( "2" ) )
	FaultsNumber:setTTF( "fonts/escom.ttf" )
	FaultsNumber:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FaultsNumber:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( FaultsNumber )
	self.FaultsNumber = FaultsNumber
	
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

