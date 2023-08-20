import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:my_prod_flutter/application/ui/theme_extensions.dart';
import 'package:my_prod_flutter/modules/profile/profile_controller.dart';

class IsTablet extends GetView<ProfileController> {
  IsTablet({Key? key}) : super(key: key);

  final log = Logger();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(controller.user.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.user.name,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 05),
                  Text(
                    controller.user.bio,
                    style: TextStyle(
                      fontSize: 16,
                      color: context.warmGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ContainedTabBarView(
              tabBarViewProperties: const TabBarViewProperties(
                physics: BouncingScrollPhysics(),
              ),
              tabBarProperties: TabBarProperties(
                height: 40,
                indicatorColor: context.rustyOrange,
                indicatorWeight: 5,
                labelColor: context.slateGreyTwo,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelColor: context.warmGrey,
              ),
              tabs: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Repos'),
                    const SizedBox(width: 10),
                    Obx(
                      () => Chip(
                        label: Text('${controller.repositories.length}'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Starred'),
                    const SizedBox(width: 10),
                    Obx(
                      () => Chip(
                        label: Text('${controller.starred.length}'),
                      ),
                    ),
                  ],
                ),
              ],
              views: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 50,
                      width: size.width * .60,
                      child: TextField(
                        controller: controller.repositoryEC,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(05),
                            borderSide: BorderSide(color: context.warmGrey),
                          ),
                          label: Text(
                            'Filter by name',
                            style: TextStyle(
                              color: context.warmGrey,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.search_rounded),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Obx(
                        () => ListView.separated(
                          separatorBuilder: (context, index) =>
                              Divider(color: context.paleGrey),
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.repositories.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: RichText(
                                text: TextSpan(
                                  text: '${controller.user.name} / ',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: controller.repositories[index].name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              subtitle: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller
                                        .repositories[index].description),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.code,
                                          color: context.slateGreyTwo,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 05),
                                        Text(
                                          controller
                                              .repositories[index].language
                                              .toString(),
                                        ),
                                        const SizedBox(width: 20),
                                        Icon(
                                          FontAwesomeIcons.codeBranch,
                                          color: context.slateGreyTwo,
                                          size: 15,
                                        ),
                                        const SizedBox(width: 05),
                                        Text(
                                          controller.repositories[index].branchs
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 50,
                      width: size.width * .60,
                      child: TextField(
                        controller: controller.starredEC,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(05),
                            borderSide: BorderSide(color: context.warmGrey),
                          ),
                          label: Text(
                            'Filter by name',
                            style: TextStyle(
                              color: context.warmGrey,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.search_rounded),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Obx(
                        () => ListView.separated(
                          separatorBuilder: (context, index) =>
                              Divider(color: context.paleGrey),
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.starred.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: RichText(
                                text: TextSpan(
                                  text: '${controller.user.name} / ',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 18,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: controller.starred[index].name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              subtitle: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.starred[index].description),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: context.slateGreyTwo,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 05),
                                        Text(
                                          controller.starred[index].stars
                                              .toString(),
                                        ),
                                        const SizedBox(width: 20),
                                        Icon(
                                          FontAwesomeIcons.codeBranch,
                                          color: context.slateGreyTwo,
                                          size: 15,
                                        ),
                                        const SizedBox(width: 05),
                                        Text(
                                          controller.starred[index].branchs
                                              .toString(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              onChange: (index) => log.i(index),
            ),
          ),
        ],
      ),
    );
  }
}
