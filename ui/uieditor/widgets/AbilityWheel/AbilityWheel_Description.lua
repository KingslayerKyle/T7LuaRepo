-- fcf1b75dd28efa13a702b765f105d55d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_DescriptionBottom" )
require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_DescriptionText" )

CoD.AbilityWheel_Description = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_Description.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_Description )
	self.id = "AbilityWheel_Description"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 233 )
	self:setTopBottom( true, false, 0, 310 )
	
	local AbilityWheelDescriptionBottom = CoD.AbilityWheel_DescriptionBottom.new( menu, controller )
	AbilityWheelDescriptionBottom:setLeftRight( false, false, -88, 88 )
	AbilityWheelDescriptionBottom:setTopBottom( false, false, -11.5, 56.5 )
	AbilityWheelDescriptionBottom:setRGB( 1, 0.93, 0.24 )
	AbilityWheelDescriptionBottom:setAlpha( 0.9 )
	AbilityWheelDescriptionBottom:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	AbilityWheelDescriptionBottom:setShaderVector( 0, 0.1, 0, 0, 0 )
	AbilityWheelDescriptionBottom:setShaderVector( 1, 0.3, 0, 0, 0 )
	AbilityWheelDescriptionBottom:setShaderVector( 2, 0, 0, 0, 0 )
	AbilityWheelDescriptionBottom:setShaderVector( 3, 0, 0, 0, 0 )
	AbilityWheelDescriptionBottom:setShaderVector( 4, 0, 0, 0, 0 )
	AbilityWheelDescriptionBottom:linkToElementModel( self, "selectedAbilityDisplayDesc", true, function ( model )
		local selectedAbilityDisplayDesc = Engine.GetModelValue( model )
		if selectedAbilityDisplayDesc then
			AbilityWheelDescriptionBottom.TextDesc:setText( Engine.Localize( selectedAbilityDisplayDesc ) )
		end
	end )
	self:addElement( AbilityWheelDescriptionBottom )
	self.AbilityWheelDescriptionBottom = AbilityWheelDescriptionBottom
	
	local AbilityWheelDescriptionText = CoD.AbilityWheel_DescriptionText.new( menu, controller )
	AbilityWheelDescriptionText:setLeftRight( false, false, -98.5, 98.5 )
	AbilityWheelDescriptionText:setTopBottom( false, false, -53.5, -17.5 )
	AbilityWheelDescriptionText:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	AbilityWheelDescriptionText:setShaderVector( 0, 0.1, 0, 0, 0 )
	AbilityWheelDescriptionText:setShaderVector( 1, 0.5, 0, 0, 0 )
	AbilityWheelDescriptionText:setShaderVector( 2, 0, 0, 0, 0 )
	AbilityWheelDescriptionText:setShaderVector( 3, 1, 0, 0, 0 )
	AbilityWheelDescriptionText:setShaderVector( 4, 0, 0, 0, 0 )
	AbilityWheelDescriptionText:linkToElementModel( self, "selectedAbilityDisplayName", true, function ( model )
		local selectedAbilityDisplayName = Engine.GetModelValue( model )
		if selectedAbilityDisplayName then
			AbilityWheelDescriptionText.TextName:setText( Engine.Localize( selectedAbilityDisplayName ) )
		end
	end )
	self:addElement( AbilityWheelDescriptionText )
	self.AbilityWheelDescriptionText = AbilityWheelDescriptionText
	
	local AbilityWheelEnemyTypeIcon = LUI.UIImage.new()
	AbilityWheelEnemyTypeIcon:setLeftRight( false, false, -43.75, 43.75 )
	AbilityWheelEnemyTypeIcon:setTopBottom( false, false, -126, -38.5 )
	AbilityWheelEnemyTypeIcon:setRGB( 1, 0.68, 0 )
	AbilityWheelEnemyTypeIcon:setAlpha( 0.9 )
	AbilityWheelEnemyTypeIcon:setScale( 0.5 )
	AbilityWheelEnemyTypeIcon:setupUIStreamedImage( 0 )
	AbilityWheelEnemyTypeIcon:linkToElementModel( self, "selectedAbilityDisplayIcon", true, function ( model )
		local selectedAbilityDisplayIcon = Engine.GetModelValue( model )
		if selectedAbilityDisplayIcon then
			AbilityWheelEnemyTypeIcon:setImage( RegisterImage( selectedAbilityDisplayIcon ) )
		end
	end )
	self:addElement( AbilityWheelEnemyTypeIcon )
	self.AbilityWheelEnemyTypeIcon = AbilityWheelEnemyTypeIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Inactive = function ()
				self:setupElementClipCounter( 1 )

				local AbilityWheelDescriptionBottomFrame2 = function ( AbilityWheelDescriptionBottom, event )
					local AbilityWheelDescriptionBottomFrame3 = function ( AbilityWheelDescriptionBottom, event )
						local AbilityWheelDescriptionBottomFrame4 = function ( AbilityWheelDescriptionBottom, event )
							local AbilityWheelDescriptionBottomFrame5 = function ( AbilityWheelDescriptionBottom, event )
								local AbilityWheelDescriptionBottomFrame6 = function ( AbilityWheelDescriptionBottom, event )
									if not event.interrupted then
										AbilityWheelDescriptionBottom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									AbilityWheelDescriptionBottom:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( AbilityWheelDescriptionBottom, event )
									else
										AbilityWheelDescriptionBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									AbilityWheelDescriptionBottomFrame6( AbilityWheelDescriptionBottom, event )
									return 
								else
									AbilityWheelDescriptionBottom:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									AbilityWheelDescriptionBottom:registerEventHandler( "transition_complete_keyframe", AbilityWheelDescriptionBottomFrame6 )
								end
							end
							
							if event.interrupted then
								AbilityWheelDescriptionBottomFrame5( AbilityWheelDescriptionBottom, event )
								return 
							else
								AbilityWheelDescriptionBottom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								AbilityWheelDescriptionBottom:setAlpha( 0.4 )
								AbilityWheelDescriptionBottom:registerEventHandler( "transition_complete_keyframe", AbilityWheelDescriptionBottomFrame5 )
							end
						end
						
						if event.interrupted then
							AbilityWheelDescriptionBottomFrame4( AbilityWheelDescriptionBottom, event )
							return 
						else
							AbilityWheelDescriptionBottom:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							AbilityWheelDescriptionBottom:registerEventHandler( "transition_complete_keyframe", AbilityWheelDescriptionBottomFrame4 )
						end
					end
					
					if event.interrupted then
						AbilityWheelDescriptionBottomFrame3( AbilityWheelDescriptionBottom, event )
						return 
					else
						AbilityWheelDescriptionBottom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						AbilityWheelDescriptionBottom:setAlpha( 0 )
						AbilityWheelDescriptionBottom:registerEventHandler( "transition_complete_keyframe", AbilityWheelDescriptionBottomFrame3 )
					end
				end
				
				AbilityWheelDescriptionBottom:completeAnimation()
				self.AbilityWheelDescriptionBottom:setAlpha( 0.7 )
				AbilityWheelDescriptionBottomFrame2( AbilityWheelDescriptionBottom, {} )
			end
		},
		Inactive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AbilityWheelDescriptionBottom:close()
		element.AbilityWheelDescriptionText:close()
		element.AbilityWheelEnemyTypeIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
