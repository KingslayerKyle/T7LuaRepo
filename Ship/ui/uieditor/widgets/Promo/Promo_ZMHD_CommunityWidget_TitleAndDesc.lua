-- 4adb0d84735b27a8615f1e001830f000
-- This hash is used for caching, delete to decompile the file again

CoD.Promo_ZMHD_CommunityWidget_TitleAndDesc = InheritFrom( LUI.UIElement )
CoD.Promo_ZMHD_CommunityWidget_TitleAndDesc.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Promo_ZMHD_CommunityWidget_TitleAndDesc )
	self.id = "Promo_ZMHD_CommunityWidget_TitleAndDesc"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 540 )
	self:setTopBottom( true, false, 0, 52 )
	
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 0, 540 )
	title:setTopBottom( true, false, 0, 52 )
	title:setAlpha( 0.8 )
	title:setText( LocalizeToUpperString( "CONTRACT_COMMUNITY_CONTRACT_ZMHD_TITLE" ) )
	title:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( title, "setText", function ( element, controller )
		UpdateWidgetHeightToMultilineText( self, element, 0 )
	end )
	self:addElement( title )
	self.title = title
	
	local txtDescription = LUI.UIText.new()
	txtDescription:setLeftRight( true, false, 0, 514 )
	txtDescription:setTopBottom( false, true, 7, 25 )
	txtDescription:setAlpha( 0.6 )
	txtDescription:setText( Engine.Localize( "CONTRACT_COMMUNITY_CONTRACT_ZMHD_DESC" ) )
	txtDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	txtDescription:setLineSpacing( -1 )
	txtDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	txtDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( txtDescription )
	self.txtDescription = txtDescription
	
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
