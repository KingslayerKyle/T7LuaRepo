-- 1e49e6ba20e5950f4f39feeffad6ecd7
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_BlackMarket_SideBetExplaination = InheritFrom( LUI.UIElement )
CoD.CallingCards_BlackMarket_SideBetExplaination.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_BlackMarket_SideBetExplaination )
	self.id = "CallingCards_BlackMarket_SideBetExplaination"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 340 )
	self:setTopBottom( true, false, 0, 250 )
	
	local sideBetTitle = LUI.UITightText.new()
	sideBetTitle:setLeftRight( true, false, 0, 200 )
	sideBetTitle:setTopBottom( false, true, -120, -95 )
	sideBetTitle:setRGB( 0.16, 1, 0.93 )
	sideBetTitle:setText( Engine.Localize( "CONTRACT_SIDE_BET" ) )
	sideBetTitle:setTTF( "fonts/default.ttf" )
	self:addElement( sideBetTitle )
	self.sideBetTitle = sideBetTitle
	
	local sideBetDesc = LUI.UIText.new()
	sideBetDesc:setLeftRight( true, true, 0, 0 )
	sideBetDesc:setTopBottom( false, true, -90, -70 )
	sideBetDesc:setText( Engine.Localize( "CONTRACT_SIDE_BET_SET_DESCRIPTION" ) )
	sideBetDesc:setTTF( "fonts/default.ttf" )
	sideBetDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	sideBetDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( sideBetDesc )
	self.sideBetDesc = sideBetDesc
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -9, 104.9 )
	Image0:setTopBottom( false, true, -242.38, -108.38 )
	Image0:setImage( RegisterImage( "uie_t7_blackmarket_contract_callingcardset_blackjackicon" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				sideBetTitle:completeAnimation()
				self.sideBetTitle:setAlpha( 0 )
				self.clipFinished( sideBetTitle, {} )
				sideBetDesc:completeAnimation()
				self.sideBetDesc:setAlpha( 0 )
				self.clipFinished( sideBetDesc, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
			end
		},
		ViewingSideBetSet = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				sideBetTitle:completeAnimation()
				self.sideBetTitle:setAlpha( 1 )
				self.clipFinished( sideBetTitle, {} )
				sideBetDesc:completeAnimation()
				self.sideBetDesc:setAlpha( 1 )
				self.clipFinished( sideBetDesc, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ViewingSideBetSet",
			condition = function ( menu, element, event )
				return IsViewingSideBetCallingCardSet( controller )
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

