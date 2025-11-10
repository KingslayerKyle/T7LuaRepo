require( "ui.uieditor.widgets.Lobby.Common.FE_MemberBlurPanel" )

CoD.FE_MemberBlurPanelContainer = InheritFrom( LUI.UIElement )
CoD.FE_MemberBlurPanelContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_MemberBlurPanelContainer )
	self.id = "FE_MemberBlurPanelContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 348 )
	self:setTopBottom( true, false, 0, 28 )
	
	local FEMemberBlurPanel0 = CoD.FE_MemberBlurPanel.new( menu, controller )
	FEMemberBlurPanel0:setLeftRight( true, true, 0, 0 )
	FEMemberBlurPanel0:setTopBottom( true, true, 0.25, 0 )
	FEMemberBlurPanel0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	FEMemberBlurPanel0:setShaderVector( 0, 0, 3, 0, 0 )
	self:addElement( FEMemberBlurPanel0 )
	self.FEMemberBlurPanel0 = FEMemberBlurPanel0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FEMemberBlurPanel0:completeAnimation()
				self.FEMemberBlurPanel0:setAlpha( 1 )
				self.clipFinished( FEMemberBlurPanel0, {} )
			end
		},
		Transparent = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FEMemberBlurPanel0:completeAnimation()
				self.FEMemberBlurPanel0:setAlpha( 0 )
				self.clipFinished( FEMemberBlurPanel0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local FEMemberBlurPanel0Frame2 = function ( FEMemberBlurPanel0, event )
					if not event.interrupted then
						FEMemberBlurPanel0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FEMemberBlurPanel0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FEMemberBlurPanel0, event )
					else
						FEMemberBlurPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEMemberBlurPanel0:completeAnimation()
				self.FEMemberBlurPanel0:setAlpha( 0 )
				FEMemberBlurPanel0Frame2( FEMemberBlurPanel0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEMemberBlurPanel0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

