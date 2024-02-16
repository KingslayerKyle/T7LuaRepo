-- e17ec0ea4f628d77328a34f1171e81c8
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ButtonPrompt3D.requirementLabel" )
require( "ui.uieditor.widgets.HUD.ButtonPrompt3D.nameLabel" )
require( "ui.uieditor.widgets.HUD.ButtonPrompt3dcpzm_UseButtonIcon" )
require( "ui.uieditor.widgets.MPHudWidgets.WaypointArrowContainer" )
require( "ui.uieditor.widgets.MPHudWidgets.Waypoint_TextBG" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "interactivePrompt" )
	Engine.CreateModel( f1_local0, "activeActionEntityText" )
	Engine.CreateModel( f1_local0, "activeObjectiveID" )
	Engine.CreateModel( f1_local0, "objectiveTextColor" )
end

local f0_local1 = function ( f2_arg0 )
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	if f3_arg1.objId then
		f3_arg0.objIndex = f3_arg1.objId
		local f3_local0 = Engine.GetModelForController( f3_arg1.controller )
		Engine.CreateModel( f3_local0, "objective" .. f3_arg0.objIndex .. ".nearTo" )
		Engine.CreateModel( f3_local0, "objective" .. f3_arg0.objIndex .. ".isFarAway" )
		local f3_local1 = f3_arg0.objective.id
		local f3_local2 = f3_arg0.objective["3d_prompt_text"]
		local f3_local3 = f3_arg0.objective["3d_prompt_image"]
		f3_arg0:setupInteractivePrompt( f3_arg0.objIndex, 0, 0, f3_arg0.objective["3d_prompt_z_offset"] )
		f3_arg0:setupInterPromptObjectiveType( true )
		f3_arg0:setupInterPromptHideOutRange( true )
		if f3_arg0.objective.isObjective and f3_arg0.objective.waypointFarText then
			f3_arg0.WaypointText.text:setText( Engine.Localize( f3_arg0.objective.waypointFarText ) )
			f3_arg0.WaypointText.text:setupDistanceIndicator( f3_arg0.objIndex, true )
			f3_arg0.WaypointText:setState( "DefaultState" )
		else
			f3_arg0.WaypointText:setState( "NoText" )
		end
		if f3_local2 ~= nil then
			f3_arg0.nameLabel.label:setText( Engine.Localize( f3_local2 ) )
		else
			f3_arg0.nameLabel.label:setText( "" )
		end
		f3_arg0.iconImage:setImage( RegisterImage( f3_local3 ) )
	end
end

local PostLoadFunc = function ( f4_arg0 )
	f4_arg0.setupEntity = f0_local2
	f4_arg0.recenter = f0_local1
end

CoD.ButtonPrompt3dCPZM = InheritFrom( LUI.UIElement )
CoD.ButtonPrompt3dCPZM.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ButtonPrompt3dCPZM )
	self.id = "ButtonPrompt3dCPZM"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 64 )
	self.anyChildUsesUpdateState = true
	
	local requirementLabel = CoD.requirementLabel.new( menu, controller )
	requirementLabel:setLeftRight( true, false, 24, 190 )
	requirementLabel:setTopBottom( true, false, 34, 63.5 )
	requirementLabel:setAlpha( 0 )
	requirementLabel:linkToElementModel( self, nil, false, function ( model )
		requirementLabel:setModel( model, controller )
	end )
	self:addElement( requirementLabel )
	self.requirementLabel = requirementLabel
	
	local nameLabel = CoD.nameLabel.new( menu, controller )
	nameLabel:setLeftRight( true, false, 24, 129 )
	nameLabel:setTopBottom( true, false, 14, 34 )
	self:addElement( nameLabel )
	self.nameLabel = nameLabel
	
	local ButtonPrompt3dcpzmUseButtonIcon = CoD.ButtonPrompt3dcpzm_UseButtonIcon.new( menu, controller )
	ButtonPrompt3dcpzmUseButtonIcon:setLeftRight( true, false, 4.5, 43.5 )
	ButtonPrompt3dcpzmUseButtonIcon:setTopBottom( true, false, 12.5, 51.5 )
	ButtonPrompt3dcpzmUseButtonIcon:setAlpha( 0 )
	ButtonPrompt3dcpzmUseButtonIcon:linkToElementModel( self, nil, false, function ( model )
		ButtonPrompt3dcpzmUseButtonIcon:setModel( model, controller )
	end )
	self:addElement( ButtonPrompt3dcpzmUseButtonIcon )
	self.ButtonPrompt3dcpzmUseButtonIcon = ButtonPrompt3dcpzmUseButtonIcon
	
	local iconImage = LUI.UIImage.new()
	iconImage:setLeftRight( true, false, 4.5, 43.5 )
	iconImage:setTopBottom( true, false, 4.5, 43.5 )
	iconImage:setImage( RegisterImage( "uie_t7_hud_prompt_ammo_64" ) )
	self:addElement( iconImage )
	self.iconImage = iconImage
	
	local directionalArrow = CoD.WaypointArrowContainer.new( menu, controller )
	directionalArrow:setLeftRight( true, false, 4.5, 45.5 )
	directionalArrow:setTopBottom( true, false, 8, 40 )
	directionalArrow:linkToElementModel( self, "direction", true, function ( model )
		local direction = Engine.GetModelValue( model )
		if direction then
			directionalArrow:setZRot( Add( 90, direction ) )
		end
	end )
	self:addElement( directionalArrow )
	self.directionalArrow = directionalArrow
	
	local WaypointText = CoD.Waypoint_TextBG.new( menu, controller )
	WaypointText:setLeftRight( false, false, -144, -64 )
	WaypointText:setTopBottom( false, false, -46, -25 )
	WaypointText:setAlpha( 0 )
	WaypointText:linkToElementModel( self, nil, false, function ( model )
		WaypointText:setModel( model, controller )
	end )
	self:addElement( WaypointText )
	self.WaypointText = WaypointText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				local requirementLabelFrame2 = function ( requirementLabel, event )
					local requirementLabelFrame3 = function ( requirementLabel, event )
						if not event.interrupted then
							requirementLabel:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
						end
						requirementLabel:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( requirementLabel, event )
						else
							requirementLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						requirementLabelFrame3( requirementLabel, event )
						return 
					else
						requirementLabel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						requirementLabel:registerEventHandler( "transition_complete_keyframe", requirementLabelFrame3 )
					end
				end
				
				requirementLabel:completeAnimation()
				self.requirementLabel:setAlpha( 0 )
				requirementLabelFrame2( requirementLabel, {} )

				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 1 )
				self.clipFinished( nameLabel, {} )

				ButtonPrompt3dcpzmUseButtonIcon:completeAnimation()
				self.ButtonPrompt3dcpzmUseButtonIcon:setLeftRight( true, false, 4.5, 43.5 )
				self.ButtonPrompt3dcpzmUseButtonIcon:setTopBottom( true, false, 12.5, 51.5 )
				self.ButtonPrompt3dcpzmUseButtonIcon:setAlpha( 1 )
				self.clipFinished( ButtonPrompt3dcpzmUseButtonIcon, {} )

				iconImage:completeAnimation()
				self.iconImage:setAlpha( 0 )
				self.clipFinished( iconImage, {} )

				directionalArrow:completeAnimation()
				self.directionalArrow:setAlpha( 0 )
				self.clipFinished( directionalArrow, {} )

				WaypointText:completeAnimation()
				self.WaypointText:setAlpha( 0 )
				self.clipFinished( WaypointText, {} )
			end,
			HideRequirementLabel = function ()
				self:setupElementClipCounter( 3 )

				requirementLabel:completeAnimation()
				self.requirementLabel:setAlpha( 0 )
				self.clipFinished( requirementLabel, {} )
				local ButtonPrompt3dcpzmUseButtonIconFrame2 = function ( ButtonPrompt3dcpzmUseButtonIcon, event )
					if not event.interrupted then
						ButtonPrompt3dcpzmUseButtonIcon:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					ButtonPrompt3dcpzmUseButtonIcon:setLeftRight( true, false, 4.5, 43.5 )
					ButtonPrompt3dcpzmUseButtonIcon:setTopBottom( true, false, 4.5, 43.5 )
					ButtonPrompt3dcpzmUseButtonIcon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ButtonPrompt3dcpzmUseButtonIcon, event )
					else
						ButtonPrompt3dcpzmUseButtonIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ButtonPrompt3dcpzmUseButtonIcon:completeAnimation()
				self.ButtonPrompt3dcpzmUseButtonIcon:setLeftRight( true, false, 4.5, 43.5 )
				self.ButtonPrompt3dcpzmUseButtonIcon:setTopBottom( true, false, 4.5, 43.5 )
				self.ButtonPrompt3dcpzmUseButtonIcon:setAlpha( 1 )
				ButtonPrompt3dcpzmUseButtonIconFrame2( ButtonPrompt3dcpzmUseButtonIcon, {} )
				local iconImageFrame2 = function ( iconImage, event )
					if not event.interrupted then
						iconImage:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					iconImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( iconImage, event )
					else
						iconImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				iconImage:completeAnimation()
				self.iconImage:setAlpha( 0 )
				iconImageFrame2( iconImage, {} )
			end
		},
		Clamped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				requirementLabel:completeAnimation()
				self.requirementLabel:setAlpha( 0 )
				self.clipFinished( requirementLabel, {} )

				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 0 )
				self.clipFinished( nameLabel, {} )

				ButtonPrompt3dcpzmUseButtonIcon:completeAnimation()
				self.ButtonPrompt3dcpzmUseButtonIcon:setAlpha( 0 )
				self.clipFinished( ButtonPrompt3dcpzmUseButtonIcon, {} )

				iconImage:completeAnimation()
				self.iconImage:setAlpha( 1 )
				self.clipFinished( iconImage, {} )

				directionalArrow:completeAnimation()
				self.directionalArrow:setLeftRight( true, false, 4.5, 45.5 )
				self.directionalArrow:setTopBottom( true, false, 4.5, 43.5 )
				self.directionalArrow:setAlpha( 1 )
				self.clipFinished( directionalArrow, {} )

				WaypointText:completeAnimation()
				self.WaypointText:setAlpha( 0 )
				self.clipFinished( WaypointText, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				requirementLabel:completeAnimation()
				self.requirementLabel:setAlpha( 0 )
				self.clipFinished( requirementLabel, {} )

				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 0 )
				self.clipFinished( nameLabel, {} )

				ButtonPrompt3dcpzmUseButtonIcon:completeAnimation()
				self.ButtonPrompt3dcpzmUseButtonIcon:setLeftRight( true, false, 4.5, 43.5 )
				self.ButtonPrompt3dcpzmUseButtonIcon:setTopBottom( true, false, 12.5, 51.5 )
				self.ButtonPrompt3dcpzmUseButtonIcon:setAlpha( 0 )
				self.clipFinished( ButtonPrompt3dcpzmUseButtonIcon, {} )
				local iconImageFrame2 = function ( iconImage, event )
					if not event.interrupted then
						iconImage:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					iconImage:setAlpha( 0.85 )
					if event.interrupted then
						self.clipFinished( iconImage, event )
					else
						iconImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				iconImage:completeAnimation()
				self.iconImage:setAlpha( 1 )
				iconImageFrame2( iconImage, {} )

				directionalArrow:completeAnimation()
				self.directionalArrow:setAlpha( 0 )
				self.clipFinished( directionalArrow, {} )

				WaypointText:completeAnimation()
				self.WaypointText:setAlpha( 1 )
				self.clipFinished( WaypointText, {} )
			end,
			HideRequirementLabel = function ()
				self:setupElementClipCounter( 3 )

				local nameLabelFrame2 = function ( nameLabel, event )
					if not event.interrupted then
						nameLabel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					nameLabel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( nameLabel, event )
					else
						nameLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 0 )
				nameLabelFrame2( nameLabel, {} )

				ButtonPrompt3dcpzmUseButtonIcon:completeAnimation()
				self.ButtonPrompt3dcpzmUseButtonIcon:setLeftRight( true, false, 4.5, 43.5 )
				self.ButtonPrompt3dcpzmUseButtonIcon:setTopBottom( true, false, 12.5, 51.5 )
				self.ButtonPrompt3dcpzmUseButtonIcon:setAlpha( 0 )
				self.clipFinished( ButtonPrompt3dcpzmUseButtonIcon, {} )
				local iconImageFrame2 = function ( iconImage, event )
					if not event.interrupted then
						iconImage:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					iconImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( iconImage, event )
					else
						iconImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				iconImage:completeAnimation()
				self.iconImage:setAlpha( 0.85 )
				iconImageFrame2( iconImage, {} )
			end
		},
		HideRequirementLabel = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				requirementLabel:completeAnimation()
				self.requirementLabel:setAlpha( 0 )
				self.clipFinished( requirementLabel, {} )

				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 1 )
				self.clipFinished( nameLabel, {} )

				ButtonPrompt3dcpzmUseButtonIcon:completeAnimation()
				self.ButtonPrompt3dcpzmUseButtonIcon:setAlpha( 0 )
				self.clipFinished( ButtonPrompt3dcpzmUseButtonIcon, {} )

				iconImage:completeAnimation()
				self.iconImage:setAlpha( 1 )
				self.clipFinished( iconImage, {} )

				directionalArrow:completeAnimation()
				self.directionalArrow:setAlpha( 0 )
				self.clipFinished( directionalArrow, {} )

				WaypointText:completeAnimation()
				self.WaypointText:setAlpha( 0 )
				self.clipFinished( WaypointText, {} )
			end,
			Hidden = function ()
				self:setupElementClipCounter( 3 )

				local nameLabelFrame2 = function ( nameLabel, event )
					if not event.interrupted then
						nameLabel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					nameLabel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( nameLabel, event )
					else
						nameLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 1 )
				nameLabelFrame2( nameLabel, {} )

				ButtonPrompt3dcpzmUseButtonIcon:completeAnimation()
				self.ButtonPrompt3dcpzmUseButtonIcon:setAlpha( 0 )
				self.clipFinished( ButtonPrompt3dcpzmUseButtonIcon, {} )

				directionalArrow:completeAnimation()
				self.directionalArrow:setAlpha( 0 )
				self.clipFinished( directionalArrow, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Clamped",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "clamped" )
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "nearTo", 0 )
			end
		},
		{
			stateName = "HideRequirementLabel",
			condition = function ( menu, element, event )
				return IsObjectiveRequirementLabelHidden( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "clamped", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "clamped"
		} )
	end )
	self:linkToElementModel( self, "nearTo", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "nearTo"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "interactivePrompt.activeObjectiveID" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "interactivePrompt.activeObjectiveID"
		} )
	end )

	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsElementInState( element, "DefaultState" ) then
			SetElementStateByElementName( self, "nameLabel", controller, "Small" )
		else
			SetElementStateByElementName( self, "nameLabel", controller, "DefaultState" )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.requirementLabel:close()
		element.nameLabel:close()
		element.ButtonPrompt3dcpzmUseButtonIcon:close()
		element.directionalArrow:close()
		element.WaypointText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
