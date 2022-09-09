-- 17a02a81b104e8b1d85565b23c73302f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Promo.Promo_ThermometerAndRewards" )

local PostLoadFunc = function ( self, controller, menu )
end

CoD.Promo_ThermometerTabWidget = InheritFrom( LUI.UIElement )
CoD.Promo_ThermometerTabWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Promo_ThermometerTabWidget )
	self.id = "Promo_ThermometerTabWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 550 )
	self.anyChildUsesUpdateState = true
	
	local ThermometerProgressWidget = CoD.Promo_ThermometerAndRewards.new( menu, controller )
	ThermometerProgressWidget:setLeftRight( true, false, 736.94, 1084.55 )
	ThermometerProgressWidget:setTopBottom( true, false, 66.67, 504.17 )
	ThermometerProgressWidget:setScale( 0.9 )
	ThermometerProgressWidget:subscribeToGlobalModel( controller, "RoadToCWLRewardList", nil, function ( model )
		ThermometerProgressWidget:setModel( model, controller )
	end )
	self:addElement( ThermometerProgressWidget )
	self.ThermometerProgressWidget = ThermometerProgressWidget
	
	local RewardsText = LUI.UIText.new()
	RewardsText:setLeftRight( true, false, 720.28, 1135.28 )
	RewardsText:setTopBottom( true, false, 55.67, 77.67 )
	RewardsText:setRGB( 0.22, 0.94, 1 )
	RewardsText:setText( Engine.Localize( "CONTRACT_COMMUNITY_TOTAL_REQUIREMENT" ) )
	RewardsText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	RewardsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RewardsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RewardsText )
	self.RewardsText = RewardsText
	
	local txtDescription = LUI.UIText.new()
	txtDescription:setLeftRight( true, false, 100, 640 )
	txtDescription:setTopBottom( true, false, 93, 111 )
	txtDescription:setAlpha( 0.6 )
	txtDescription:setText( Engine.Localize( "CONTRACT_COMMUNITY_CONTRACT_DESC" ) )
	txtDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	txtDescription:setLineSpacing( -1 )
	txtDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtDescription )
	self.txtDescription = txtDescription
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 100, 640 )
	title:setTopBottom( true, false, 34, 86 )
	title:setText( LocalizeToUpperString( "CONTRACT_COMMUNITY_TITLE_ROADTOCHAMPS" ) )
	title:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( title )
	self.title = title
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local txtDescriptionFrame2 = function ( txtDescription, event )
					if not event.interrupted then
						txtDescription:beginAnimation( "keyframe", 3000, false, false, CoD.TweenType.Linear )
					end
					txtDescription:setAlpha( 0.6 )
					if event.interrupted then
						self.clipFinished( txtDescription, event )
					else
						txtDescription:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				txtDescription:completeAnimation()
				self.txtDescription:setAlpha( 0.6 )
				txtDescriptionFrame2( txtDescription, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ThermometerProgressWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
