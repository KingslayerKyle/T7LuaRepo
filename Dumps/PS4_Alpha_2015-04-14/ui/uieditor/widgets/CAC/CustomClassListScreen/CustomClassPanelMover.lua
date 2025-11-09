require( "ui.uieditor.widgets.CAC.CustomClassListScreen.CustomClassLayout" )
require( "ui.uieditor.widgets.hintText" )

CoD.CustomClassPanelMover = InheritFrom( LUI.UIElement )
CoD.CustomClassPanelMover.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CustomClassPanelMover )
	self.id = "CustomClassPanelMover"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 536 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local NavHeader = LUI.UIImage.new()
	NavHeader:setLeftRight( true, false, 0, 1280 )
	NavHeader:setTopBottom( true, false, -2, 51.34 )
	NavHeader:setRGB( 0.15, 0.15, 0.19 )
	NavHeader:setAlpha( 0.65 )
	NavHeader:setImage( RegisterImage( "uie_img_t7_menu_customclass_navheader02" ) )
	NavHeader:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( NavHeader )
	self.NavHeader = NavHeader
	
	local CustomClassLayout0 = CoD.CustomClassLayout.new( menu, controller )
	CustomClassLayout0:setLeftRight( true, false, -2437, 1280 )
	CustomClassLayout0:setTopBottom( true, false, 61, 506 )
	CustomClassLayout0:setRGB( 1, 1, 1 )
	CustomClassLayout0:setAlpha( 0 )
	CustomClassLayout0:linkToElementModel( self, nil, false, function ( model )
		CustomClassLayout0:setModel( model, controller )
	end )
	self:addElement( CustomClassLayout0 )
	self.CustomClassLayout0 = CustomClassLayout0
	
	local hintText0 = CoD.hintText.new( menu, controller )
	hintText0:setLeftRight( true, false, 99, 699 )
	hintText0:setTopBottom( true, false, 516, 536 )
	hintText0:setRGB( 1, 1, 1 )
	self:addElement( hintText0 )
	self.hintText0 = hintText0
	
	local wildcardsLabel = LUI.UITightText.new()
	wildcardsLabel:setLeftRight( true, false, 157, 288 )
	wildcardsLabel:setTopBottom( true, false, 10, 40 )
	wildcardsLabel:setRGB( 0.87, 0.88, 0.78 )
	wildcardsLabel:setAlpha( 0.5 )
	wildcardsLabel:setText( Engine.Localize( "MENU_WILDCARDS_CAPS" ) )
	wildcardsLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( wildcardsLabel )
	self.wildcardsLabel = wildcardsLabel
	
	local weaponsLabel = LUI.UITightText.new()
	weaponsLabel:setLeftRight( true, false, 322, 434 )
	weaponsLabel:setTopBottom( true, false, 10, 40 )
	weaponsLabel:setRGB( 0.87, 0.88, 0.78 )
	weaponsLabel:setAlpha( 0.5 )
	weaponsLabel:setText( Engine.Localize( "MPUI_WEAPONS_CAPS" ) )
	weaponsLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( weaponsLabel )
	self.weaponsLabel = weaponsLabel
	
	local equipmentLabel = LUI.UITightText.new()
	equipmentLabel:setLeftRight( true, false, 471, 595 )
	equipmentLabel:setTopBottom( true, false, 10, 40 )
	equipmentLabel:setRGB( 0.87, 0.88, 0.78 )
	equipmentLabel:setAlpha( 0.5 )
	equipmentLabel:setText( Engine.Localize( "MENU_EQUIPMENT_CAPS" ) )
	equipmentLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( equipmentLabel )
	self.equipmentLabel = equipmentLabel
	
	local perksLabel = LUI.UITightText.new()
	perksLabel:setLeftRight( true, false, 627, 701 )
	perksLabel:setTopBottom( true, false, 10, 40 )
	perksLabel:setRGB( 0.87, 0.88, 0.78 )
	perksLabel:setAlpha( 0.5 )
	perksLabel:setText( Engine.Localize( "MPUI_PERKS_CAPS" ) )
	perksLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( perksLabel )
	self.perksLabel = perksLabel
	
	local leftBumper = LUI.UIImage.new()
	leftBumper:setLeftRight( true, false, 100, 132 )
	leftBumper:setTopBottom( true, false, 9, 41 )
	leftBumper:setRGB( 1, 1, 1 )
	leftBumper:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	leftBumper:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			leftBumper:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( leftBumper )
	self.leftBumper = leftBumper
	
	local rightBumper = LUI.UIImage.new()
	rightBumper:setLeftRight( true, false, 728, 760 )
	rightBumper:setTopBottom( true, false, 10, 42 )
	rightBumper:setRGB( 1, 1, 1 )
	rightBumper:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	rightBumper:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rightBumper:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rightBumper )
	self.rightBumper = rightBumper
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				CustomClassLayout0:completeAnimation()
				self.CustomClassLayout0:setAlpha( 0 )
				self.clipFinished( CustomClassLayout0, {} )
				wildcardsLabel:completeAnimation()
				self.wildcardsLabel:setRGB( 0.87, 0.88, 0.78 )
				self.wildcardsLabel:setAlpha( 0.5 )
				self.wildcardsLabel:setZoom( 0 )
				self.clipFinished( wildcardsLabel, {} )
				weaponsLabel:completeAnimation()
				self.weaponsLabel:setRGB( 0.87, 0.88, 0.78 )
				self.weaponsLabel:setAlpha( 0.5 )
				self.weaponsLabel:setZoom( 0 )
				self.clipFinished( weaponsLabel, {} )
				equipmentLabel:completeAnimation()
				self.equipmentLabel:setRGB( 0.87, 0.88, 0.78 )
				self.equipmentLabel:setAlpha( 0.5 )
				self.equipmentLabel:setZoom( 0 )
				self.clipFinished( equipmentLabel, {} )
				perksLabel:completeAnimation()
				self.perksLabel:setRGB( 0.87, 0.88, 0.78 )
				self.perksLabel:setAlpha( 0.5 )
				self.perksLabel:setZoom( 0 )
				self.clipFinished( perksLabel, {} )
			end
		},
		Wildcards = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				CustomClassLayout0:completeAnimation()
				self.CustomClassLayout0:setLeftRight( true, false, 0, 3717 )
				self.CustomClassLayout0:setTopBottom( true, false, 61, 506 )
				self.CustomClassLayout0:setAlpha( 1 )
				self.clipFinished( CustomClassLayout0, {} )
				wildcardsLabel:completeAnimation()
				self.wildcardsLabel:setRGB( 0.91, 0.39, 0.05 )
				self.wildcardsLabel:setAlpha( 1 )
				self.clipFinished( wildcardsLabel, {} )
				weaponsLabel:completeAnimation()
				self.weaponsLabel:setRGB( 0.87, 0.88, 0.78 )
				self.weaponsLabel:setAlpha( 0.5 )
				self.weaponsLabel:setZoom( 0 )
				self.clipFinished( weaponsLabel, {} )
				equipmentLabel:completeAnimation()
				self.equipmentLabel:setRGB( 0.87, 0.88, 0.78 )
				self.equipmentLabel:setAlpha( 0.5 )
				self.equipmentLabel:setZoom( 0 )
				self.clipFinished( equipmentLabel, {} )
				perksLabel:completeAnimation()
				self.perksLabel:setRGB( 0.87, 0.88, 0.78 )
				self.perksLabel:setAlpha( 0.5 )
				self.perksLabel:setZoom( 0 )
				self.clipFinished( perksLabel, {} )
			end,
			Weapons = function ()
				self:setupElementClipCounter( 5 )
				local CustomClassLayout0Frame2 = function ( CustomClassLayout0, event )
					if not event.interrupted then
						CustomClassLayout0:beginAnimation( "keyframe", 100, true, true, CoD.TweenType.Linear )
					end
					CustomClassLayout0:setLeftRight( true, false, -170, 3547 )
					CustomClassLayout0:setTopBottom( true, false, 61, 506 )
					CustomClassLayout0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CustomClassLayout0, event )
					else
						CustomClassLayout0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClassLayout0:completeAnimation()
				self.CustomClassLayout0:setLeftRight( true, false, 0, 3717 )
				self.CustomClassLayout0:setTopBottom( true, false, 61, 506 )
				self.CustomClassLayout0:setAlpha( 1 )
				CustomClassLayout0Frame2( CustomClassLayout0, {} )
				local wildcardsLabelFrame2 = function ( wildcardsLabel, event )
					if not event.interrupted then
						wildcardsLabel:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
					end
					wildcardsLabel:setRGB( 0.87, 0.88, 0.78 )
					wildcardsLabel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( wildcardsLabel, event )
					else
						wildcardsLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcardsLabel:completeAnimation()
				self.wildcardsLabel:setRGB( 0.91, 0.39, 0.05 )
				self.wildcardsLabel:setAlpha( 1 )
				wildcardsLabelFrame2( wildcardsLabel, {} )
				local weaponsLabelFrame2 = function ( weaponsLabel, event )
					if not event.interrupted then
						weaponsLabel:beginAnimation( "keyframe", 19, false, true, CoD.TweenType.Linear )
					end
					weaponsLabel:setRGB( 0.91, 0.39, 0.05 )
					weaponsLabel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weaponsLabel, event )
					else
						weaponsLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponsLabel:completeAnimation()
				self.weaponsLabel:setRGB( 0.87, 0.88, 0.78 )
				self.weaponsLabel:setAlpha( 0.5 )
				weaponsLabelFrame2( weaponsLabel, {} )
				equipmentLabel:completeAnimation()
				self.equipmentLabel:setRGB( 0.87, 0.88, 0.78 )
				self.equipmentLabel:setAlpha( 0.5 )
				self.equipmentLabel:setZoom( 0 )
				self.clipFinished( equipmentLabel, {} )
				perksLabel:completeAnimation()
				self.perksLabel:setRGB( 0.87, 0.88, 0.78 )
				self.perksLabel:setAlpha( 0.5 )
				self.perksLabel:setZoom( 0 )
				self.clipFinished( perksLabel, {} )
			end
		},
		Weapons = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				CustomClassLayout0:completeAnimation()
				self.CustomClassLayout0:setLeftRight( true, false, -170, 3547 )
				self.CustomClassLayout0:setTopBottom( true, false, 61, 506 )
				self.CustomClassLayout0:setAlpha( 1 )
				self.clipFinished( CustomClassLayout0, {} )
				wildcardsLabel:completeAnimation()
				self.wildcardsLabel:setRGB( 0.87, 0.88, 0.78 )
				self.wildcardsLabel:setAlpha( 0.5 )
				self.wildcardsLabel:setZoom( 0 )
				self.clipFinished( wildcardsLabel, {} )
				weaponsLabel:completeAnimation()
				self.weaponsLabel:setRGB( 0.91, 0.39, 0.05 )
				self.weaponsLabel:setAlpha( 1 )
				self.clipFinished( weaponsLabel, {} )
				equipmentLabel:completeAnimation()
				self.equipmentLabel:setRGB( 0.87, 0.88, 0.78 )
				self.equipmentLabel:setAlpha( 0.5 )
				self.equipmentLabel:setZoom( 0 )
				self.clipFinished( equipmentLabel, {} )
				perksLabel:completeAnimation()
				self.perksLabel:setRGB( 0.87, 0.88, 0.78 )
				self.perksLabel:setAlpha( 0.5 )
				self.perksLabel:setZoom( 0 )
				self.clipFinished( perksLabel, {} )
			end,
			Wildcards = function ()
				self:setupElementClipCounter( 5 )
				local CustomClassLayout0Frame2 = function ( CustomClassLayout0, event )
					if not event.interrupted then
						CustomClassLayout0:beginAnimation( "keyframe", 70, true, true, CoD.TweenType.Linear )
					end
					CustomClassLayout0:setLeftRight( true, false, 0, 3717 )
					CustomClassLayout0:setTopBottom( true, false, 61, 506 )
					CustomClassLayout0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CustomClassLayout0, event )
					else
						CustomClassLayout0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClassLayout0:completeAnimation()
				self.CustomClassLayout0:setLeftRight( true, false, -170, 3717 )
				self.CustomClassLayout0:setTopBottom( true, false, 61, 506 )
				self.CustomClassLayout0:setAlpha( 1 )
				CustomClassLayout0Frame2( CustomClassLayout0, {} )
				local wildcardsLabelFrame2 = function ( wildcardsLabel, event )
					if not event.interrupted then
						wildcardsLabel:beginAnimation( "keyframe", 19, false, true, CoD.TweenType.Linear )
					end
					wildcardsLabel:setRGB( 0.91, 0.39, 0.05 )
					wildcardsLabel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( wildcardsLabel, event )
					else
						wildcardsLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcardsLabel:completeAnimation()
				self.wildcardsLabel:setRGB( 0.87, 0.88, 0.78 )
				self.wildcardsLabel:setAlpha( 0.5 )
				wildcardsLabelFrame2( wildcardsLabel, {} )
				local weaponsLabelFrame2 = function ( weaponsLabel, event )
					if not event.interrupted then
						weaponsLabel:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
					end
					weaponsLabel:setRGB( 0.87, 0.88, 0.78 )
					weaponsLabel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( weaponsLabel, event )
					else
						weaponsLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponsLabel:completeAnimation()
				self.weaponsLabel:setRGB( 0.91, 0.39, 0.05 )
				self.weaponsLabel:setAlpha( 1 )
				weaponsLabelFrame2( weaponsLabel, {} )
				equipmentLabel:completeAnimation()
				self.equipmentLabel:setRGB( 0.87, 0.88, 0.78 )
				self.equipmentLabel:setAlpha( 0.5 )
				self.equipmentLabel:setZoom( 0 )
				self.clipFinished( equipmentLabel, {} )
				perksLabel:completeAnimation()
				self.perksLabel:setRGB( 0.87, 0.88, 0.78 )
				self.perksLabel:setAlpha( 0.5 )
				self.perksLabel:setZoom( 0 )
				self.clipFinished( perksLabel, {} )
			end,
			Equipment = function ()
				self:setupElementClipCounter( 5 )
				local CustomClassLayout0Frame2 = function ( CustomClassLayout0, event )
					if not event.interrupted then
						CustomClassLayout0:beginAnimation( "keyframe", 150, true, true, CoD.TweenType.Linear )
					end
					CustomClassLayout0:setLeftRight( true, false, -1303.33, 2416.33 )
					CustomClassLayout0:setTopBottom( true, false, 61, 506 )
					CustomClassLayout0:setAlpha( 1 )
					CustomClassLayout0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( CustomClassLayout0, event )
					else
						CustomClassLayout0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClassLayout0:completeAnimation()
				self.CustomClassLayout0:setLeftRight( true, false, -170, 3717 )
				self.CustomClassLayout0:setTopBottom( true, false, 61, 506 )
				self.CustomClassLayout0:setAlpha( 1 )
				self.CustomClassLayout0:setZoom( 0 )
				CustomClassLayout0Frame2( CustomClassLayout0, {} )
				wildcardsLabel:completeAnimation()
				self.wildcardsLabel:setRGB( 0.87, 0.88, 0.78 )
				self.wildcardsLabel:setAlpha( 0.5 )
				self.wildcardsLabel:setZoom( 0 )
				self.clipFinished( wildcardsLabel, {} )
				local weaponsLabelFrame2 = function ( weaponsLabel, event )
					if not event.interrupted then
						weaponsLabel:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
					end
					weaponsLabel:setRGB( 0.87, 0.88, 0.78 )
					weaponsLabel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( weaponsLabel, event )
					else
						weaponsLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponsLabel:completeAnimation()
				self.weaponsLabel:setRGB( 0.91, 0.39, 0.05 )
				self.weaponsLabel:setAlpha( 1 )
				weaponsLabelFrame2( weaponsLabel, {} )
				local equipmentLabelFrame2 = function ( equipmentLabel, event )
					if not event.interrupted then
						equipmentLabel:beginAnimation( "keyframe", 19, false, true, CoD.TweenType.Linear )
					end
					equipmentLabel:setRGB( 0.91, 0.39, 0.05 )
					equipmentLabel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( equipmentLabel, event )
					else
						equipmentLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				equipmentLabel:completeAnimation()
				self.equipmentLabel:setRGB( 0.87, 0.88, 0.78 )
				self.equipmentLabel:setAlpha( 0.5 )
				equipmentLabelFrame2( equipmentLabel, {} )
				perksLabel:completeAnimation()
				self.perksLabel:setRGB( 0.87, 0.88, 0.78 )
				self.perksLabel:setAlpha( 0.5 )
				self.perksLabel:setZoom( 0 )
				self.clipFinished( perksLabel, {} )
			end
		},
		Equipment = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				CustomClassLayout0:completeAnimation()
				self.CustomClassLayout0:setLeftRight( true, false, -1303.33, 2416.33 )
				self.CustomClassLayout0:setTopBottom( true, false, 61, 506 )
				self.CustomClassLayout0:setAlpha( 1 )
				self.clipFinished( CustomClassLayout0, {} )
				wildcardsLabel:completeAnimation()
				self.wildcardsLabel:setRGB( 0.87, 0.88, 0.78 )
				self.wildcardsLabel:setAlpha( 0.5 )
				self.wildcardsLabel:setZoom( 0 )
				self.clipFinished( wildcardsLabel, {} )
				weaponsLabel:completeAnimation()
				self.weaponsLabel:setRGB( 0.87, 0.88, 0.78 )
				self.weaponsLabel:setAlpha( 0.5 )
				self.weaponsLabel:setZoom( 0 )
				self.clipFinished( weaponsLabel, {} )
				equipmentLabel:completeAnimation()
				self.equipmentLabel:setRGB( 0.91, 0.39, 0.05 )
				self.equipmentLabel:setAlpha( 1 )
				self.clipFinished( equipmentLabel, {} )
				perksLabel:completeAnimation()
				self.perksLabel:setRGB( 0.87, 0.88, 0.78 )
				self.perksLabel:setAlpha( 0.5 )
				self.perksLabel:setZoom( 0 )
				self.clipFinished( perksLabel, {} )
			end,
			Weapons = function ()
				self:setupElementClipCounter( 5 )
				local CustomClassLayout0Frame2 = function ( CustomClassLayout0, event )
					if not event.interrupted then
						CustomClassLayout0:beginAnimation( "keyframe", 150, true, true, CoD.TweenType.Linear )
					end
					CustomClassLayout0:setLeftRight( true, false, -170, 3547 )
					CustomClassLayout0:setTopBottom( true, false, 61, 506 )
					CustomClassLayout0:setAlpha( 1 )
					CustomClassLayout0:setZoom( 0 )
					if event.interrupted then
						self.clipFinished( CustomClassLayout0, event )
					else
						CustomClassLayout0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClassLayout0:completeAnimation()
				self.CustomClassLayout0:setLeftRight( true, false, -1303.33, 2416.33 )
				self.CustomClassLayout0:setTopBottom( true, false, 61, 506 )
				self.CustomClassLayout0:setAlpha( 1 )
				self.CustomClassLayout0:setZoom( 0 )
				CustomClassLayout0Frame2( CustomClassLayout0, {} )
				wildcardsLabel:completeAnimation()
				self.wildcardsLabel:setRGB( 0.87, 0.88, 0.78 )
				self.wildcardsLabel:setAlpha( 0.5 )
				self.wildcardsLabel:setZoom( 0 )
				self.clipFinished( wildcardsLabel, {} )
				local weaponsLabelFrame2 = function ( weaponsLabel, event )
					if not event.interrupted then
						weaponsLabel:beginAnimation( "keyframe", 19, false, true, CoD.TweenType.Linear )
					end
					weaponsLabel:setRGB( 0.91, 0.39, 0.05 )
					weaponsLabel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( weaponsLabel, event )
					else
						weaponsLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				weaponsLabel:completeAnimation()
				self.weaponsLabel:setRGB( 0.87, 0.88, 0.78 )
				self.weaponsLabel:setAlpha( 0.5 )
				weaponsLabelFrame2( weaponsLabel, {} )
				local equipmentLabelFrame2 = function ( equipmentLabel, event )
					if not event.interrupted then
						equipmentLabel:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
					end
					equipmentLabel:setRGB( 0.87, 0.88, 0.78 )
					equipmentLabel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( equipmentLabel, event )
					else
						equipmentLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				equipmentLabel:completeAnimation()
				self.equipmentLabel:setRGB( 0.91, 0.39, 0.05 )
				self.equipmentLabel:setAlpha( 1 )
				equipmentLabelFrame2( equipmentLabel, {} )
				perksLabel:completeAnimation()
				self.perksLabel:setRGB( 0.87, 0.88, 0.78 )
				self.perksLabel:setAlpha( 0.5 )
				self.perksLabel:setZoom( 0 )
				self.clipFinished( perksLabel, {} )
			end,
			Perks = function ()
				self:setupElementClipCounter( 5 )
				local CustomClassLayout0Frame2 = function ( CustomClassLayout0, event )
					if not event.interrupted then
						CustomClassLayout0:beginAnimation( "keyframe", 150, true, true, CoD.TweenType.Linear )
					end
					CustomClassLayout0:setLeftRight( true, false, -2437, 1280 )
					CustomClassLayout0:setTopBottom( true, false, 61, 506 )
					CustomClassLayout0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CustomClassLayout0, event )
					else
						CustomClassLayout0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClassLayout0:completeAnimation()
				self.CustomClassLayout0:setLeftRight( true, false, -1303.33, 2416.33 )
				self.CustomClassLayout0:setTopBottom( true, false, 61, 506 )
				self.CustomClassLayout0:setAlpha( 1 )
				CustomClassLayout0Frame2( CustomClassLayout0, {} )
				wildcardsLabel:completeAnimation()
				self.wildcardsLabel:setRGB( 0.87, 0.88, 0.78 )
				self.wildcardsLabel:setAlpha( 0.5 )
				self.wildcardsLabel:setZoom( 0 )
				self.clipFinished( wildcardsLabel, {} )
				weaponsLabel:completeAnimation()
				self.weaponsLabel:setRGB( 0.87, 0.88, 0.78 )
				self.weaponsLabel:setAlpha( 0.5 )
				self.weaponsLabel:setZoom( 0 )
				self.clipFinished( weaponsLabel, {} )
				local equipmentLabelFrame2 = function ( equipmentLabel, event )
					if not event.interrupted then
						equipmentLabel:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
					end
					equipmentLabel:setRGB( 0.87, 0.88, 0.78 )
					equipmentLabel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( equipmentLabel, event )
					else
						equipmentLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				equipmentLabel:completeAnimation()
				self.equipmentLabel:setRGB( 0.91, 0.39, 0.05 )
				self.equipmentLabel:setAlpha( 1 )
				equipmentLabelFrame2( equipmentLabel, {} )
				local perksLabelFrame2 = function ( perksLabel, event )
					if not event.interrupted then
						perksLabel:beginAnimation( "keyframe", 19, false, true, CoD.TweenType.Linear )
					end
					perksLabel:setRGB( 0.91, 0.39, 0.05 )
					perksLabel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( perksLabel, event )
					else
						perksLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				perksLabel:completeAnimation()
				self.perksLabel:setRGB( 0.87, 0.88, 0.78 )
				self.perksLabel:setAlpha( 0.5 )
				perksLabelFrame2( perksLabel, {} )
			end
		},
		Perks = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				CustomClassLayout0:completeAnimation()
				self.CustomClassLayout0:setLeftRight( true, false, -2437, 1280 )
				self.CustomClassLayout0:setTopBottom( true, false, 61, 506 )
				self.CustomClassLayout0:setAlpha( 1 )
				self.clipFinished( CustomClassLayout0, {} )
				wildcardsLabel:completeAnimation()
				self.wildcardsLabel:setRGB( 0.87, 0.88, 0.78 )
				self.wildcardsLabel:setAlpha( 0.5 )
				self.wildcardsLabel:setZoom( 0 )
				self.clipFinished( wildcardsLabel, {} )
				weaponsLabel:completeAnimation()
				self.weaponsLabel:setRGB( 0.87, 0.88, 0.78 )
				self.weaponsLabel:setAlpha( 0.5 )
				self.weaponsLabel:setZoom( 0 )
				self.clipFinished( weaponsLabel, {} )
				equipmentLabel:completeAnimation()
				self.equipmentLabel:setRGB( 0.87, 0.88, 0.78 )
				self.equipmentLabel:setAlpha( 0.5 )
				self.equipmentLabel:setZoom( 0 )
				self.clipFinished( equipmentLabel, {} )
				perksLabel:completeAnimation()
				self.perksLabel:setRGB( 0.91, 0.39, 0.05 )
				self.perksLabel:setAlpha( 1 )
				self.clipFinished( perksLabel, {} )
			end,
			Equipment = function ()
				self:setupElementClipCounter( 5 )
				local CustomClassLayout0Frame2 = function ( CustomClassLayout0, event )
					if not event.interrupted then
						CustomClassLayout0:beginAnimation( "keyframe", 150, true, true, CoD.TweenType.Linear )
					end
					CustomClassLayout0:setLeftRight( true, false, -1303.33, 2416.33 )
					CustomClassLayout0:setTopBottom( true, false, 61, 506 )
					CustomClassLayout0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CustomClassLayout0, event )
					else
						CustomClassLayout0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClassLayout0:completeAnimation()
				self.CustomClassLayout0:setLeftRight( true, false, -2437, 1280 )
				self.CustomClassLayout0:setTopBottom( true, false, 61, 506 )
				self.CustomClassLayout0:setAlpha( 1 )
				CustomClassLayout0Frame2( CustomClassLayout0, {} )
				wildcardsLabel:completeAnimation()
				self.wildcardsLabel:setRGB( 0.87, 0.88, 0.78 )
				self.wildcardsLabel:setAlpha( 0.5 )
				self.wildcardsLabel:setZoom( 0 )
				self.clipFinished( wildcardsLabel, {} )
				weaponsLabel:completeAnimation()
				self.weaponsLabel:setRGB( 0.87, 0.88, 0.78 )
				self.weaponsLabel:setAlpha( 0.5 )
				self.weaponsLabel:setZoom( 0 )
				self.clipFinished( weaponsLabel, {} )
				local equipmentLabelFrame2 = function ( equipmentLabel, event )
					if not event.interrupted then
						equipmentLabel:beginAnimation( "keyframe", 19, false, true, CoD.TweenType.Linear )
					end
					equipmentLabel:setRGB( 0.91, 0.39, 0.05 )
					equipmentLabel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( equipmentLabel, event )
					else
						equipmentLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				equipmentLabel:completeAnimation()
				self.equipmentLabel:setRGB( 0.87, 0.88, 0.78 )
				self.equipmentLabel:setAlpha( 0.5 )
				equipmentLabelFrame2( equipmentLabel, {} )
				local perksLabelFrame2 = function ( perksLabel, event )
					if not event.interrupted then
						perksLabel:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
					end
					perksLabel:setRGB( 0.87, 0.88, 0.78 )
					perksLabel:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( perksLabel, event )
					else
						perksLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				perksLabel:completeAnimation()
				self.perksLabel:setRGB( 0.91, 0.39, 0.05 )
				self.perksLabel:setAlpha( 1 )
				perksLabelFrame2( perksLabel, {} )
			end
		}
	}
	CustomClassLayout0.id = "CustomClassLayout0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.CustomClassLayout0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.CustomClassLayout0:close()
		self.hintText0:close()
		self.leftBumper:close()
		self.rightBumper:close()
		CoD.CustomClassPanelMover.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

